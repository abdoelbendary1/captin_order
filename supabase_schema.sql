CREATE TYPE user_role AS ENUM ('admin', 'manager', 'captain', 'barista', 'cashier');
CREATE TYPE table_status AS ENUM ('available', 'occupied', 'reserved');
CREATE TYPE order_status AS ENUM ('open', 'sent_to_kitchen', 'completed', 'cancelled', 'refunded');
CREATE TYPE order_type AS ENUM ('dine_in', 'take_away');
CREATE TYPE payment_method AS ENUM ('cash', 'card', 'digital_wallet');
CREATE TYPE shift_status AS ENUM ('active', 'closed');

CREATE TABLE profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    full_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    pin_code TEXT NOT NULL,
    role user_role NOT NULL DEFAULT 'captain',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

CREATE TABLE zones (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

CREATE TABLE tables (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    zone_id UUID REFERENCES zones(id) ON DELETE CASCADE,
    table_number TEXT NOT NULL,
    capacity INT DEFAULT 4 NOT NULL,
    status table_status NOT NULL DEFAULT 'available',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

CREATE TABLE categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    display_order INT DEFAULT 0 NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

CREATE TABLE menu_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    category_id UUID REFERENCES categories(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    image_url TEXT,
    is_available BOOLEAN DEFAULT true NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

CREATE TABLE modifier_groups (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    is_required BOOLEAN DEFAULT false NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

CREATE TABLE modifier_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    group_id UUID REFERENCES modifier_groups(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    extra_price NUMERIC(10, 2) DEFAULT 0.00 NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

CREATE TABLE menu_item_modifiers (
    menu_item_id UUID REFERENCES menu_items(id) ON DELETE CASCADE,
    modifier_group_id UUID REFERENCES modifier_groups(id) ON DELETE CASCADE,
    PRIMARY KEY (menu_item_id, modifier_group_id)
);

CREATE TABLE shifts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    staff_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    shift_name TEXT NOT NULL,
    start_time TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    end_time TIMESTAMP WITH TIME ZONE,
    status shift_status NOT NULL DEFAULT 'active',
    starting_cash NUMERIC(10, 2) DEFAULT 0.00 NOT NULL,
    expected_cash NUMERIC(10, 2) DEFAULT 0.00 NOT NULL,
    actual_cash NUMERIC(10, 2) DEFAULT 0.00 NOT NULL,
    total_sales NUMERIC(10, 2) DEFAULT 0.00 NOT NULL,
    total_orders INT DEFAULT 0 NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

CREATE TABLE orders (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    table_id UUID REFERENCES tables(id) ON DELETE SET NULL,
    captain_id UUID REFERENCES profiles(id) ON DELETE SET NULL,
    shift_id UUID REFERENCES shifts(id) ON DELETE SET NULL,
    order_number TEXT NOT NULL,
    order_type order_type NOT NULL DEFAULT 'dine_in',
    status order_status NOT NULL DEFAULT 'open',
    subtotal NUMERIC(10, 2) DEFAULT 0.00 NOT NULL,
    tax_amount NUMERIC(10, 2) DEFAULT 0.00 NOT NULL,
    service_charge NUMERIC(10, 2) DEFAULT 0.00 NOT NULL,
    tip_amount NUMERIC(10, 2) DEFAULT 0.00 NOT NULL,
    total_amount NUMERIC(10, 2) DEFAULT 0.00 NOT NULL,
    payment_method payment_method,
    paid_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

CREATE TABLE order_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
    menu_item_id UUID REFERENCES menu_items(id) ON DELETE SET NULL,
    item_name TEXT NOT NULL,
    unit_price NUMERIC(10, 2) NOT NULL,
    quantity INT DEFAULT 1 NOT NULL,
    total_price NUMERIC(10, 2) NOT NULL,
    sent_to_printer BOOLEAN DEFAULT false NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

CREATE TABLE order_item_modifiers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    order_item_id UUID REFERENCES order_items(id) ON DELETE CASCADE,
    modifier_name TEXT NOT NULL,
    extra_price NUMERIC(10, 2) DEFAULT 0.00 NOT NULL
);

CREATE TABLE printers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    ip_address TEXT NOT NULL,
    printer_type TEXT NOT NULL,
    is_connected BOOLEAN DEFAULT true NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

CREATE TABLE system_settings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    cafe_name TEXT NOT NULL,
    logo_url TEXT,
    welcome_message TEXT,
    vat_percent NUMERIC(5, 2) DEFAULT 15.00 NOT NULL,
    service_charge_percent NUMERIC(5, 2) DEFAULT 5.00 NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

CREATE TABLE audit_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    staff_id UUID REFERENCES profiles(id) ON DELETE SET NULL,
    action TEXT NOT NULL,
    details JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE zones ENABLE ROW LEVEL SECURITY;
ALTER TABLE tables ENABLE ROW LEVEL SECURITY;
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE menu_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE modifier_groups ENABLE ROW LEVEL SECURITY;
ALTER TABLE modifier_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE menu_item_modifiers ENABLE ROW LEVEL SECURITY;
ALTER TABLE shifts ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_item_modifiers ENABLE ROW LEVEL SECURITY;
ALTER TABLE printers ENABLE ROW LEVEL SECURITY;
ALTER TABLE system_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE audit_logs ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read access to profiles" ON profiles FOR SELECT USING (true);
CREATE POLICY "Allow admin all on profiles" ON profiles FOR ALL USING (auth.jwt() ->> 'role' = 'admin');

CREATE POLICY "Allow authenticated full access to zones" ON zones FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow authenticated full access to tables" ON tables FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow authenticated full access to categories" ON categories FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow authenticated full access to menu_items" ON menu_items FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow authenticated full access to modifier_groups" ON modifier_groups FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow authenticated full access to modifier_items" ON modifier_items FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow authenticated full access to menu_item_modifiers" ON menu_item_modifiers FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow authenticated full access to shifts" ON shifts FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow authenticated full access to orders" ON orders FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow authenticated full access to order_items" ON order_items FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow authenticated full access to order_item_modifiers" ON order_item_modifiers FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow authenticated full access to printers" ON printers FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow authenticated full access to system_settings" ON system_settings FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow authenticated full access to audit_logs" ON audit_logs FOR ALL USING (auth.role() = 'authenticated');
