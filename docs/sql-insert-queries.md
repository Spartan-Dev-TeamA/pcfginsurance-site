# SQL INSERT Queries for Form Submissions

This document contains the SQL INSERT statements to insert form data into each Supabase database table.

## 1. Quick Quote Form → `quote_forms` table

```sql
INSERT INTO quote_forms (
  name,
  email,
  phone,
  business_name,
  insurance_type,
  message,
  tag
) VALUES (
  'John Doe',
  'john@example.com',
  '555-123-4567',
  'Example Business LLC',
  'workers-comp',
  'Need workers compensation coverage for 10 employees',
  'quick-quote'
);
```

## 2. Contact Form → `contact_forms` table

```sql
INSERT INTO contact_forms (
  first_name,
  last_name,
  email,
  phone,
  state,
  company,
  insurance_type,
  industry,
  message,
  preferred_contact,
  tag
) VALUES (
  'John',
  'Doe',
  'john@example.com',
  '555-123-4567',
  'NY',
  'Example Business LLC',
  'general-liability',
  'construction',
  'Looking for comprehensive general liability coverage',
  'either',
  'contact'
);
```

## 3. Commercial Quote Form → `commercial_quotes` table

```sql
INSERT INTO commercial_quotes (
  first_name,
  last_name,
  business_name,
  email,
  phone,
  business_address,
  city,
  state,
  zip_code,
  industry,
  employees,
  insurance_types,
  years_in_business,
  annual_revenue,
  business_description,
  current_coverage,
  preferred_contact_method,
  additional_needs,
  best_time_to_call,
  tag
) VALUES (
  'John',
  'Doe',
  'Example Construction LLC',
  'john@example.com',
  '555-123-4567',
  '123 Business St',
  'Albany',
  'NY',
  '12345',
  'construction',
  '11-25',
  '["workers-comp", "general-liability", "commercial-auto"]'::jsonb,
  '3-5',
  '500k-1m',
  'General construction contractor specializing in residential work',
  'State Farm',
  'either',
  'Need coverage for new construction projects',
  'morning',
  'commercial-quote'
);
```

## 4. Workers' Compensation Lead → `workers_comp_leads` table

```sql
INSERT INTO workers_comp_leads (
  first_name,
  last_name,
  business_name,
  email,
  phone,
  tag
) VALUES (
  'John',
  'Doe',
  'Example Construction LLC',
  'john@example.com',
  '555-123-4567',
  'work-comp'
);
```

## 5. Commercial Auto Lead → `commercial_auto_leads` table

```sql
INSERT INTO commercial_auto_leads (
  first_name,
  last_name,
  business_name,
  email,
  phone,
  tag
) VALUES (
  'John',
  'Doe',
  'Example Delivery Service',
  'john@example.com',
  '555-123-4567',
  'commercial-auto'
);
```

## 6. General Liability Lead → `general_liability_leads` table

```sql
INSERT INTO general_liability_leads (
  first_name,
  last_name,
  business_name,
  email,
  phone,
  tag
) VALUES (
  'John',
  'Doe',
  'Example Business LLC',
  'john@example.com',
  '555-123-4567',
  'general-liability'
);
```

## 7. BOP Lead → `bop_leads` table

```sql
INSERT INTO bop_leads (
  first_name,
  last_name,
  business_name,
  email,
  phone,
  tag
) VALUES (
  'John',
  'Doe',
  'Example Retail Store',
  'john@example.com',
  '555-123-4567',
  'business-owners-policy'
);
```

## 8. Personal Lines Quote → `personal_lines_quotes` table

```sql
INSERT INTO personal_lines_quotes (
  first_name,
  last_name,
  email,
  phone,
  date_of_birth,
  marital_status,
  street_address,
  city,
  state,
  zip_code,
  residence_type,
  years_at_address,
  insurance_types,
  current_carrier,
  coverage_start_date,
  vehicle_year,
  vehicle_make,
  vehicle_model,
  vehicle_usage,
  annual_mileage,
  home_year_built,
  home_square_feet,
  home_construction_type,
  home_purchase_price,
  current_premium,
  reason_for_quote,
  additional_coverage,
  preferred_contact_method,
  tag
) VALUES (
  'Jane',
  'Smith',
  'jane@example.com',
  '555-987-6543',
  '1985-03-15',
  'married',
  '456 Main Street',
  'Rochester',
  'NY',
  '14620',
  'house',
  5,
  '["auto", "home"]'::jsonb,
  'Geico',
  '2024-10-01',
  2020,
  'Honda',
  'Civic',
  'commute',
  12000,
  1995,
  2400,
  'frame',
  '$275,000',
  '$2,400',
  'better-rate',
  'Looking for bundled auto and home coverage',
  'either',
  'personal-lines-quote'
);
```

## 9. Claim Report → `claim_reports` table

```sql
INSERT INTO claim_reports (
  policy_number,
  insured_name,
  claim_type,
  loss_date,
  loss_time,
  loss_location,
  loss_description,
  injuries,
  police_report,
  contact_phone,
  tag
) VALUES (
  'POL123456789',
  'John Doe',
  'auto-accident',
  '2024-09-10',
  '14:30:00',
  '123 Main St, Albany, NY',
  'Rear-ended at traffic light, moderate damage to vehicle bumper',
  false,
  true,
  '555-123-4567',
  'claim-report'
);
```

## 10. Career Application → `career_applications` table

```sql
INSERT INTO career_applications (
  first_name,
  last_name,
  email,
  phone,
  position,
  location,
  experience,
  licenses,
  cover_letter,
  referral,
  consent,
  tag
) VALUES (
  'Sarah',
  'Johnson',
  'sarah@example.com',
  '555-456-7890',
  'Insurance Sales Producer',
  'Remote',
  '3-5',
  'Property & Casualty License (NY)',
  'I am excited to join PCFG Insurance Services and contribute to your growing team...',
  'LinkedIn',
  true,
  'career-application'
);
```

## Example Parameterized Queries (Recommended for Security)

Instead of direct value insertion, use parameterized queries to prevent SQL injection:

### Using Supabase JavaScript Client (Recommended)
```javascript
const { data, error } = await supabase
  .from('quote_forms')
  .insert([{
    name: formData.name,
    email: formData.email,
    phone: formData.phone,
    business_name: formData.business_name,
    insurance_type: formData.insurance_type,
    message: formData.message,
    tag: 'quick-quote'
  }]);
```

### Using SQL with Parameters (PostgreSQL)
```sql
INSERT INTO quote_forms (
  name, email, phone, business_name, insurance_type, message, tag
) VALUES ($1, $2, $3, $4, $5, $6, $7);
```

## Important Notes

1. **JSONB Fields**: `insurance_types` fields use JSONB format with array syntax
2. **Boolean Fields**: Use `true`/`false` for boolean values (injuries, police_report, consent)
3. **Date/Time Fields**: Use ISO format for dates ('YYYY-MM-DD') and times ('HH:MM:SS')
4. **Default Values**: Many fields have defaults set in the database schema
5. **Auto-Generated**: `id`, `created_at`, and `updated_at` are automatically handled
6. **Security**: Always use parameterized queries or the Supabase client library to prevent SQL injection
7. **Row Level Security**: All tables have RLS enabled with policies allowing anonymous INSERT and authenticated SELECT

## Batch Insert Example

For multiple records:
```sql
INSERT INTO contact_forms (first_name, last_name, email, phone, tag) VALUES 
('John', 'Doe', 'john@example.com', '555-123-4567', 'contact'),
('Jane', 'Smith', 'jane@example.com', '555-987-6543', 'contact'),
('Bob', 'Johnson', 'bob@example.com', '555-456-7890', 'contact');
```