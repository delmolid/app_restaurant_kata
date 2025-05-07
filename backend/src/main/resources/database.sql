CREATE TABLE IF NOT EXISTS `users` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_name` VARCHAR(255) NOT NULL,
    `user_email` VARCHAR(255) NOT NULL,
    `user_password` VARCHAR(255) NOT NULL,
    `user_phone` VARCHAR(20) NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE
    `users` ADD UNIQUE `users_user_email_unique`(`user_email`);
CREATE TABLE IF NOT EXISTS `restaurants` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `restaurant_name` VARCHAR(255) NOT NULL,
    `restaurant_address` VARCHAR(255) NOT NULL,
    `restaurant_contact` VARCHAR(20) NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS `menu_items` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `menu_name` VARCHAR(255) NOT NULL,
    `menu_description` TEXT NOT NULL,
    `menu_price` DECIMAL(8, 2) NOT NULL,
    `menu_image` VARCHAR(255) NOT NULL,
    `menu_available` BOOLEAN NOT NULL DEFAULT TRUE,
    `restaurant_id` BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants`(`id`) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS `orders` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `status` ENUM('pending', 'confirmed', 'preparing', 'ready', 'delivering', 'delivered', 'cancelled') NOT NULL DEFAULT 'pending',
    `delivery_id` BIGINT UNSIGNED,
    `total_price` DECIMAL(10, 2) NOT NULL,
    `restaurant_id` BIGINT UNSIGNED NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`delivery_id`) REFERENCES `delivery`(`id`) ON DELETE SET NULL,
    FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS `payments` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `payment_amount` DECIMAL(10, 2) NOT NULL,
    `payment_method` ENUM('credit_card', 'debit_card', 'paypal', 'cash') NOT NULL,
    `payment_status` ENUM('pending', 'completed', 'failed', 'refunded') NOT NULL DEFAULT 'pending',
    `paid_at` DATETIME,
    `order_id` BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS `addresses` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `address` TEXT NOT NULL,
    `latitude` DECIMAL(10, 8) NOT NULL,
    `longitude` DECIMAL(11, 8) NOT NULL,
    `order_id` BIGINT UNSIGNED,
    `user_id` BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON DELETE SET NULL,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS `delivery` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `vehicle_type` ENUM('car', 'motorcycle', 'bicycle', 'foot') NOT NULL,
    `available` BOOLEAN NOT NULL DEFAULT TRUE,
    `location_lat` DECIMAL(10, 8) NOT NULL,
    `location_long` DECIMAL(11, 8) NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS `order_items` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `menu_item_id` BIGINT UNSIGNED NOT NULL,
    `quantity` INT NOT NULL DEFAULT 1,
    `unit_price` DECIMAL(8, 2) NOT NULL,
    `order_id` BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON DELETE CASCADE
);
ALTER TABLE
    `restaurants` ADD CONSTRAINT `restaurants_id_foreign` FOREIGN KEY(`id`) REFERENCES `users`(`id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_users_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_delivery_id_foreign` FOREIGN KEY(`delivery_id`) REFERENCES `delivery`(`id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_restaurants_id_foreign` FOREIGN KEY(`restaurant_id`) REFERENCES `restaurants`(`id`);
ALTER TABLE
    `order_items` ADD CONSTRAINT `order_items_menu_items_id_foreign` FOREIGN KEY(`menu_item_id`) REFERENCES `menu_items`(`id`);
ALTER TABLE
    `addresses` ADD CONSTRAINT `addresses_users_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `payments` ADD CONSTRAINT `payments_orders_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `orders`(`id`);
ALTER TABLE
    `addresses` ADD CONSTRAINT `addresses_orders_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `orders`(`id`);
ALTER TABLE
    `menu_items` ADD CONSTRAINT `menu_items_restaurants_id_foreign` FOREIGN KEY(`restaurant_id`) REFERENCES `restaurants`(`id`);
ALTER TABLE
    `order_items` ADD CONSTRAINT `order_items_orders_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `orders`(`id`);
CREATE INDEX idx_restaurant_id ON menu_items(restaurant_id);
CREATE INDEX idx_order_id ON order_items(order_id);
CREATE INDEX idx_user_id ON orders(user_id);
CREATE INDEX idx_payment_status ON payments(payment_status);