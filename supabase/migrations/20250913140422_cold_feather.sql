/*
  # Create commercial quotes table

  1. New Tables
    - `commercial_quotes`
      - `id` (uuid, primary key)
      - `first_name` (text)
      - `last_name` (text)
      - `business_name` (text)
      - `email` (text)
      - `phone` (text)
      - `business_address` (text)
      - `city` (text)
      - `state` (text)
      - `zip_code` (text)
      - `industry` (text)
      - `employees` (text)
      - `insurance_types` (jsonb) - Array of selected insurance types
      - `years_in_business` (text)
      - `annual_revenue` (text)
      - `business_description` (text)
      - `current_coverage` (text)
      - `preferred_contact_method` (text)
      - `additional_needs` (text)
      - `best_time_to_call` (text)
      - `tag` (text)
      - `lead_id` (uuid) - Reference to related lead
      - `lead_source` (text) - Source table of lead
      - `created_at` (timestamp)
      - `updated_at` (timestamp)

  2. Security
    - Enable RLS on `commercial_quotes` table
    - Add policies for public insert and authenticated read
*/

CREATE TABLE IF NOT EXISTS commercial_quotes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name text,
  last_name text,
  business_name text,
  email text,
  phone text,
  business_address text,
  city text,
  state text,
  zip_code text,
  industry text,
  employees text,
  insurance_types jsonb DEFAULT '[]'::jsonb,
  years_in_business text,
  annual_revenue text,
  business_description text,
  current_coverage text,
  preferred_contact_method text DEFAULT 'either',
  additional_needs text,
  best_time_to_call text,
  tag text DEFAULT 'commercial-quote',
  lead_id uuid,
  lead_source text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE commercial_quotes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public insert on commercial_quotes"
  ON commercial_quotes
  FOR INSERT
  TO anon
  WITH CHECK (true);

CREATE POLICY "Allow authenticated read on commercial_quotes"
  ON commercial_quotes
  FOR SELECT
  TO authenticated
  USING (true);