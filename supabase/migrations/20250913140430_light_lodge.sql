/*
  # Create lead tables for specialized forms

  1. New Tables
    - `workers_comp_leads` - Workers compensation leads
    - `commercial_auto_leads` - Commercial auto insurance leads  
    - `general_liability_leads` - General liability insurance leads
    - `bop_leads` - Business owner's policy leads

  Each table contains:
    - `id` (uuid, primary key)
    - `first_name` (text)
    - `last_name` (text) 
    - `business_name` (text)
    - `email` (text)
    - `phone` (text)
    - `tag` (text) - Lead type identifier
    - `created_at` (timestamp)
    - `updated_at` (timestamp)

  2. Security
    - Enable RLS on all lead tables
    - Add policies for public insert and authenticated read
*/

-- Workers Compensation Leads
CREATE TABLE IF NOT EXISTS workers_comp_leads (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name text,
  last_name text,
  business_name text,
  email text,
  phone text,
  tag text DEFAULT 'work-comp',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE workers_comp_leads ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public insert on workers_comp_leads"
  ON workers_comp_leads
  FOR INSERT
  TO anon
  WITH CHECK (true);

CREATE POLICY "Allow authenticated read on workers_comp_leads"
  ON workers_comp_leads
  FOR SELECT
  TO authenticated
  USING (true);

-- Commercial Auto Leads
CREATE TABLE IF NOT EXISTS commercial_auto_leads (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name text,
  last_name text,
  business_name text,
  email text,
  phone text,
  tag text DEFAULT 'commercial-auto',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE commercial_auto_leads ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public insert on commercial_auto_leads"
  ON commercial_auto_leads
  FOR INSERT
  TO anon
  WITH CHECK (true);

CREATE POLICY "Allow authenticated read on commercial_auto_leads"
  ON commercial_auto_leads
  FOR SELECT
  TO authenticated
  USING (true);

-- General Liability Leads
CREATE TABLE IF NOT EXISTS general_liability_leads (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name text,
  last_name text,
  business_name text,
  email text,
  phone text,
  tag text DEFAULT 'general-liability',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE general_liability_leads ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public insert on general_liability_leads"
  ON general_liability_leads
  FOR INSERT
  TO anon
  WITH CHECK (true);

CREATE POLICY "Allow authenticated read on general_liability_leads"
  ON general_liability_leads
  FOR SELECT
  TO authenticated
  USING (true);

-- Business Owner's Policy Leads
CREATE TABLE IF NOT EXISTS bop_leads (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name text,
  last_name text,
  business_name text,
  email text,
  phone text,
  tag text DEFAULT 'business-owners-policy',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE bop_leads ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public insert on bop_leads"
  ON bop_leads
  FOR INSERT
  TO anon
  WITH CHECK (true);

CREATE POLICY "Allow authenticated read on bop_leads"
  ON bop_leads
  FOR SELECT
  TO authenticated
  USING (true);