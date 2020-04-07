INSERT INTO products (
  gtin,
  gtin_encoding,
  name,
  brand_name,
  properties,
  source,
  created_at,
  updated_at
)
select
  gtin_cd as gtin,
  'gtin_13' as gtin_encoding,
  trim(gtin_nm) as name,
  brand_nm as brand_name,
  json_strip_nulls(
    json_build_object(
      'weight_g', m_g,
      'weight_ounce', m_oz,
      'volume_ml', m_ml,
      'volume_fluid_ounce', m_floz,
      'unit_count', pkg_unit,
      'alcohol_by_volume', m_abv,
      'alcohol_by_weight', m_abw
    )
  ) as properties,
  'product_open_data' as source,
  now() as created_at,
  now() as updated_at
from gtin
left join brand on brand.bsin = gtin.bsin
where gtin_nm is not null and trim(gtin_nm) <> '';
