/*
  # Create personal lines quotes table

  1. New Tables
    - `personal_lines_quotes`
      - `id` (uuid, primary key)
      - `first_name` (text)
      - `last_name` (text)
      - `email` (text)
      - `phone` (text)
      - `date_of_birth` (date)
      - `marital_status` (text)
      - `street_address` (text)
      - `city` (text)
      - `state` (text)
      - `zip_code` (text)
      - `residence_type` (text)
      - `years_at_address` (integer)
      - `insurance_types` (jsonb) - Array of selected insurance types
      - `current_carrier` (text)
      - `coverage_start_date` (date)
      - `vehicle_year` (integer)
      - `vehicle_make` (text)
      - `vehicle_model` (text)
      - `vehicle_usage` (text)
      - `annual_mileage` (integer)
      - `home_year_built` (integer)
      - `home_square_feet` (integer)
      - `home_construction_type` (text)
      - `home_purchase_price` (text)
      - `current_premium` (text)
      - `reason_for_quote` (text)
      - `additional_coverage` (text)
      - `preferred_contact_method` (text)
      - `tag` (text)
      - `created_at` (timestamp)
      - `updated_at` (timestamp)

  2. Security
    - Enable RLS on `personal_lines_quotes` table
    - Add policies for public insert and authenticated read
*/

CREATE TABLE IF NOT EXISTS personal_lines_quotes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name text,
  last_name text,
  email text,
  phone text,
  date_of_birth date,
  marital_status text,
  street_address text,
  city text,
  state text,
  zip_code text,
  residence_type text,
  years_at_address integer,
  insurance_types jsonb DEFAULT '[]'::jsonb,
  current_carrier text,
  coverage_start_date date,
  vehicle_year integer,
  vehicle_make text,
  vehicle_model text,
  vehicle_usage text,
  annual_mileage integer,
  home_year_built integer,
  home_square_feet integer,
  home_construction_type text,
  home_purchase_price text,
  current_premium text,
  reason_for_quote text,
  additional_coverage text,
  preferred_contact_method text DEFAULT 'either',
  tag text DEFAULT 'personal-lines-quote',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE personal_lines_quotes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public insert on personal_lines_quotes"
  ON personal_lines_quotes
  FOR INSERT
  TO anon
  WITH CHECK (true);

CREATE POLICY "Allow authenticated read on personal_lines_quotes"
  ON personal_lines_quotes
  FOR SELECT
  TO authenticated
  USING (true);