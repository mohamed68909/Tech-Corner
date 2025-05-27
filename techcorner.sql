
 Create Database techcorner;
CREATE TABLE `admins` (
    `admin_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE `users` (
    `user_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(20),
    `address` TEXT,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE `categories` (
    `category_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `description` TEXT
);


CREATE TABLE `brands` (
    `brand_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL
);

CREATE TABLE `products` (
    `product_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(150) NOT NULL,
    `description` TEXT,
    `price` DECIMAL(10, 2) NOT NULL,
    `image` VARCHAR(255),
    `category_id` INT,
    `brand_id` INT,
    `stock` INT DEFAULT 0,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`category_id`) REFERENCES `categories`(`category_id`) ON DELETE SET NULL,
    FOREIGN KEY (`brand_id`) REFERENCES `brands`(`brand_id`) ON DELETE SET NULL
);


CREATE TABLE `cart` (
    `cart_id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT,
    `product_id` INT,
    `quantity` INT DEFAULT 1,
    `added_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE CASCADE,
    FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`) ON DELETE CASCADE
);


CREATE TABLE `orders` (
    `order_id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT,
    `order_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `total_price` DECIMAL(10, 2) NOT NULL,
    `status` VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE CASCADE
);


CREATE TABLE `order_items` (
    `order_item_id` INT AUTO_INCREMENT PRIMARY KEY,
    `order_id` INT,
    `product_id` INT,
    `quantity` INT NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`) ON DELETE CASCADE,
    FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`) ON DELETE CASCADE
);


CREATE TABLE `payment_cards` (
    `card_id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT,
    `card_number` VARCHAR(20) NOT NULL,
    `card_holder_name` VARCHAR(100) NOT NULL,
    `expiry_date` DATE NOT NULL,
    `cvv` VARCHAR(4) NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE CASCADE
);


CREATE TABLE `payments` (
    `payment_id` INT AUTO_INCREMENT PRIMARY KEY,
    `order_id` INT,
    `payment_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `amount` DECIMAL(10, 2) NOT NULL,
    `payment_method` VARCHAR(50) NOT NULL,
    FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`) ON DELETE CASCADE
);
INSERT INTO products (product_id, name, description, price, image, category_id, stock, created_at) VALUES
(1, 'MacBook Pro 14\"', '14-inch Apple M1 Pro chip', 1999.00, 'macbook14.jpg', 1, 10, '2025-05-12 14:57:11'),
(2, 'iPhone 14 Pro', '6.1-inch display, A16 Bionic', 1099.00, 'iphone14pro.jpg', 2, 25, '2025-05-12 14:57:11'),
(3, 'Apple Watch 7', '45mm GPS + Cellular', 499.00, 'watch7.jpg', 3, 15, '2025-05-12 14:57:11'),
(4, 'AirPods Pro', 'Noise cancellation earbuds', 249.00, 'airpodspro.jpg', 4, 100, '2025-05-12 14:57:11'),
(5, 'Apple Pencil 2nd Gen', 'Wireless charging pencil', 129.00, 'pencil2.jpg', 5, 50, '2025-05-12 14:57:11'),
(6, 'Apple iPhone 13 Pro', 'The Apple iPhone 13 Pro features a 6.1″ Super Retina XDR display and triple-lens 12 MP camera system.', 27000.00, 'Apple iPhone 13 Pro.jpeg', 2, 10, '2025-05-12 14:57:11'),
(7, 'Apple iPhone 13', 'The Apple iPhone 13 comes with a 6.1″ OLED display, A15 Bionic chip, and dual-camera setup.', 24000.00, 'Apple iPhone 13.jpg', 2, 10, '2025-05-12 14:57:11'),
(8, 'iPhone 13 Blue', 'iPhone 13 in Blue finish with A15 Bionic performance and improved battery life.', 24000.00, 'iPhone 13 Blue.jpeg', 2, 10, '2025-05-12 14:57:11'),
(9, 'iPhone 13 Midnight', 'iPhone 13 in Midnight color featuring Ceramic Shield front and dual 12 MP cameras.', 24000.00, 'iPhone 13 Midnight.jpeg', 2, 10, '2025-05-12 14:57:11'),
(10, 'iPhone 13 move Edition', 'iPhone 13 Movie Edition with extra storage and cinematic video recording features.', 26000.00, 'iPhone 13 move Edition.jpg', 2, 10, '2025-05-12 14:57:11'),
(11, 'iPhone 13 Pink Color', 'iPhone 13 in Pink Color, powered by A15 Bionic and dual-camera system.', 24000.00, 'iPhone 13 Pink Color.jpg', 2, 10, '2025-05-12 14:57:11'),
(12, 'iPhone 13 Pro Sierra Blue', 'iPhone 13 Pro in Sierra Blue with ProMotion 120Hz display and LiDAR scanner.', 28000.00, 'iPhone 13 Pro Sierra Blue.jpg', 2, 10, '2025-05-12 14:57:11'),
(13, 'iPhone 13 Pro Silver', 'iPhone 13 Pro Silver edition featuring stainless steel frame and triple-lens camera.', 28000.00, 'iPhone 13 Pro Silver.jpeg', 2, 10, '2025-05-12 14:57:11'),
(14, 'iPhone 13 Starlight', 'iPhone 13 Starlight with vibrant Super Retina XDR display and Dolby Vision HDR.', 24000.00, 'iPhone 13 Starlight.jpg', 2, 10, '2025-05-12 14:57:11'),
(15, 'iPhone 14 Pro 256GB', 'iPhone 14 Pro 256GB with 48 MP main camera, ProMotion display, and A16 Bionic chip.', 33000.00, 'iPhone 14 Pro 256GB.jpg', 2, 10, '2025-05-12 14:57:11'),
(16, 'iPhone 14 Pro Max Silver ', 'iPhone 14 Pro Max Silver with 6.7″ display, Always-On feature, and cinematic mode.', 37000.00, 'iPhone 14 Pro Max Silver .jpg', 2, 10, '2025-05-12 14:57:11'),
(17, 'iPhone 15 Pro Max Graphite', 'iPhone 15 Pro Max Graphite finish, USB-C port, and advanced 5-axis optical stabilization.', 45000.00, 'iPhone 15 Pro Max Graphite.jpg', 2, 10, '2025-05-12 14:57:12'),
(18, 'iPhone 16 Pro 512GB', 'iPhone 16 Pro 512GB with next-gen A18 chip, enhanced AI camera features, and fast-charge.', 50000.00, 'iPhone 16 Pro 512GB.jpeg', 2, 10, '2025-05-12 14:57:12'),
(19, 'iphone12mini', 'iPhone 12 mini with 5.4″ Super Retina display and dual-camera system in compact form.', 15000.00, 'iphone12mini.jpg', 2, 10, '2025-05-12 14:57:12'),
(20, 'iphone12pro', 'iPhone 12 Pro featuring stainless steel design, LiDAR scanner, and ProRAW photography.', 28000.00, 'iphone12pro.jpg', 2, 10, '2025-05-12 14:57:12'),
(21, 'iphone13', 'iPhone 13 with A15 Bionic chip, improved battery life, and Ceramic Shield front cover.', 24000.00, 'iphone13.jpg', 2, 10, '2025-05-12 14:57:12'),
(22, 'iphone13pro', 'iPhone 13 Pro offering ProMotion display, triple-lens camera, and surgical-grade stainless steel.', 27000.00, 'iphone13pro.jpg', 2, 10, '2025-05-12 14:57:12'),
(23, 'iphone14', 'iPhone 14 with 6.1″ OLED display, crash detection feature, and improved low-light camera.', 23000.00, 'iphone14.jpg', 2, 10, '2025-05-12 14:57:12'),
(24, 'iphone14pro', 'iPhone 14 Pro with Dynamic Island, 48 MP camera, and Always-On display technology.', 33000.00, 'iphone14pro.jpg', 2, 10, '2025-05-12 14:57:12'),
(25, 'iphone15pro', 'iPhone 15 Pro featuring titanium frame, A17 Pro chip, and upgraded 48 MP main camera.', 43000.00, 'iphone15pro.jpg', 2, 10, '2025-05-12 14:57:12'),
(26, 'iphone16pro', 'iPhone 16 Pro with A18 Bionic processor, advanced AI imaging, and 5G connectivity.', 50000.00, 'iphone16pro.jpg', 2, 10, '2025-05-12 14:57:12'),
(27, 'iphone15', 'iPhone 15 with A16 Bionic chip, dual-camera system, and USB-C port for fast charging.', 35000.00, 'iphone15.jpg', 2, 10, '2025-05-12 14:57:12'),
(28, 'OPPO A18', 'OPPO A18 with 6.56″ LCD, Helio G85 processor, and 5000 mAh battery.', 5000.00, 'OPPO A18.jpeg', 2, 10, '2025-05-12 14:57:12'),
(29, 'OPPO A78 4G', 'OPPO A78 4G featuring dual rear cameras (50+2 MP) and large 6.56″ display.', 7000.00, 'OPPO A78 4G.jpeg', 2, 10, '2025-05-12 14:57:12'),
(30, 'OPPO Find X5 Pro', 'OPPO Find X5 Pro with Sony IMX766 sensor, Hasselblad color tuning, and wireless charging.', 23000.00, 'OPPO Find X5 Pro.jpeg', 2, 10, '2025-05-12 14:57:12'),
(31, 'OPPO Reno11 Pro 5G', 'OPPO Reno11 Pro 5G with 90 Hz AMOLED display, MediaTek Dimensity chipset, and 5G support.', 12000.00, 'OPPO Reno11 Pro 5G.jpeg', 2, 10, '2025-05-12 14:57:12'),
(32, 'Phone 13 Pro Graphite', 'Phone 13 Pro Graphite finish with stainless steel frame and night mode camera.', 27000.00, 'Phone 13 Pro Graphite.jpeg', 2, 10, '2025-05-12 14:57:12'),
(33, 'Realme 12 Pro+ 5G', 'Realme 12 Pro+ 5G with 120 Hz display, Snapdragon processor, and fast charging.', 8000.00, 'Realme 12 Pro+ 5G.jpg', 2, 10, '2025-05-12 14:57:12'),
(34, 'Realme C65', 'Realme C65 with IPS display, Helio G85 chip, and AI portrait camera.', 4000.00, 'Realme C65.jpg', 2, 10, '2025-05-12 14:57:12'),
(35, 'Realme Narzo 60 5G', 'Realme Narzo 60 5G featuring 5000 mAh battery and 33 W fast charging.', 6000.00, 'Realme Narzo 60 5G.jpg', 2, 10, '2025-05-12 14:57:12'),
(36, 'Samsung Galaxy A54 5G', 'Samsung Galaxy A54 5G with Super AMOLED display, IP67 water resistance.', 8500.00, 'Samsung Galaxy A54 5G.jpg', 2, 10, '2025-05-12 14:57:12'),
(37, 'Samsung Galaxy S23 Ultra', 'Samsung Galaxy S23 Ultra with 200 MP main camera and 5000 mAh battery.', 31000.00, 'Samsung Galaxy S23 Ultra.jpg', 2, 10, '2025-05-12 14:57:12'),
(38, 'Samsung Galaxy Z Fold5', 'Samsung Galaxy Z Fold5 with foldable AMOLED display and S Pen support.', 60000.00, 'Samsung Galaxy Z Fold5.jpg', 2, 10, '2025-05-12 14:57:12'),
(39, 'Apple Mac Book', 'Apple Mac Book with sleek aluminum unibody design and macOS Monterey.', 32000.00, 'Apple Mac Book .jpeg', 1, 190, '2025-05-12 14:59:25'),
(40, 'MacBook Air 15-inch M2 (2023)', 'MacBook Air 15-inch (2023) powered by the M2 chip, with Liquid Retina display.', 46000.00, 'MacBook Air 15-inch M2 (2023).jpeg', 1, 190, '2025-05-12 14:59:25'),
(41, 'MacBook Air M1 (2020)', 'MacBook Air (2020) featuring the M1 processor and fan-less design.', 28000.00, 'MacBook Air M1 (2020).jpeg', 1, 190, '2025-05-12 14:59:25'),
(42, 'MacBook Air M2 (2022)', 'MacBook Air (2022) with M2 chip, MagSafe charging, and four-speaker sound system.', 38000.00, 'MacBook Air M2 (2022).jpeg', 1, 190, '2025-05-12 14:59:25'),
(43, 'MacBook Air Retina Intel (2019)', 'MacBook Air Retina (2019) with Intel Core i5, Retina display, and Touch ID.', 24000.00, 'MacBook Air Retina Intel (2019).jpeg', 1, 190, '2025-05-12 14:59:26'),
(44, 'MacBook Pro 13-inch Intel (2020)', 'MacBook Pro 13-inch (2020) with Intel Core i7, Touch Bar, and True Tone display.', 44000.00, 'MacBook Pro 13-inch Intel (2020).jpeg', 1, 190, '2025-05-12 14:59:26'),
(45, 'MacBook Pro 13-inch M2 (2022)', 'MacBook Pro 13-inch (2022) powered by M2 chip, silent fan-cooled design.', 50000.00, 'MacBook Pro 13-inch M2 (2022).jpeg', 1, 190, '2025-05-12 14:59:26'),
(46, 'MacBook Pro 14-inch M1 Pro (2021)', 'MacBook Pro 14-inch (2021) with M1 Pro chip, Liquid Retina XDR display, and MagSafe 3.', 65000.00, 'MacBook Pro 14-inch M1 Pro (2021).jpg', 1, 190, '2025-05-12 14:59:26'),
(47, 'MacBook Pro 14-inch M3 (2023)', 'MacBook Pro 14-inch (2023) featuring the new M3 chip and advanced thermal architecture.', 72000.00, 'MacBook Pro 14-inch M3 (2023).jpeg', 1, 190, '2025-05-12 14:59:26'),
(48, 'MacBook Pro 16-inch M1 Max (2021)', 'MacBook Pro 16-inch (2021) with M1 Max chip, up to 64GB unified memory, and ProMotion.', 85000.00, 'MacBook Pro 16-inch M1 Max (2021).jpeg', 1, 190, '2025-05-12 14:59:26'),
(49, 'MacBook Pro 16-inch M3 Max (2023)', 'MacBook Pro 16-inch (2023) powered by M3 Max chip, Liquid Retina XDR, and HDMI 2.1.', 95000.00, 'MacBook Pro 16-inch M3 Max (2023).jpeg', 1, 190, '2025-05-12 14:59:26'),
(50, 'MacBook Pro Touch Bar 15-inch (2018)', 'MacBook Pro 15-inch (2018) with Touch Bar, Intel Core i9, and Radeon Pro 560X GPU.', 36000.00, 'MacBook Pro Touch Bar 15-inch (2018).jpeg', 1, 190, '2025-05-12 14:59:26'),
(51, 'Apple iPad 9th Generation (2021)', '9th-generation iPad with 10.2″ Retina display, A13 Bionic chip, and 64GB storage.', 8500.00, 'Apple iPad 9th Generation (2021).jpg', 3, 190, '2025-05-12 15:01:07'),
(52, 'Apple iPad 10th Generation (2022)', '10th-generation iPad with 10.9″ Liquid Retina display, A14 Bionic chip, and USB-C port.', 11500.00, 'Apple iPad 10th Generation (2022).jpg', 3, 190, '2025-05-12 15:01:07'),
(53, 'iPad 8th Generation (2020)', '8th-generation iPad featuring 10.2″ Retina display, A12 Bionic chip, and Touch ID.', 7800.00, 'iPad 8th Generation (2020).jpg', 3, 190, '2025-05-12 15:01:07'),
(54, 'iPad Air 4 (2020)', 'iPad Air 4 with 10.9″ Liquid Retina display, A14 Bionic, Touch ID in the top button.', 14000.00, 'iPad Air 4 (2020).jpg', 3, 190, '2025-05-12 15:01:07'),
(55, 'iPad Air 5 (M1, 2022)', 'iPad Air 5 powered by M1 chip, 10.9″ Liquid Retina display, and 5G connectivity.', 19000.00, 'iPad Air 5 (M1, 2022).jpg', 3, 190, '2025-05-12 15:01:07'),
(56, 'iPad mini 5 (2019)', 'iPad mini 5 with 7.9″ Retina display, A12 Bionic chip, and Touch ID.', 9500.00, 'iPad mini 5 (2019).jpg', 3, 190, '2025-05-12 15:01:07'),
(57, 'iPad mini 6 (2021)', 'iPad mini 6 featuring 8.3″ Liquid Retina display, A15 Bionic, and USB-C port.', 13000.00, 'iPad mini 6 (2021).jpg', 3, 190, '2025-05-12 15:01:07'),
(58, 'iPad Pro 11-inch (3rd Gen 2021)', '3rd-gen 11″ iPad Pro with M1 chip, ProMotion display, and Thunderbolt port.', 33000.00, 'iPad Pro 11-inch (3rd Gen 2021).jpg', 3, 190, '2025-05-12 15:01:07'),
(59, 'iPad Pro 11-inch (4th Gen 2022)', '4th-gen 11″ iPad Pro powered by M2 chip, ProMotion XDR display, and 5G support.', 38000.00, 'iPad Pro 11-inch (4th Gen 2022).jpg', 3, 190, '2025-05-12 15:01:07'),
(60, 'iPad Pro 12.9-inch (5th Gen 2021)', '5th-gen 12.9″ iPad Pro with M1 chip, mini-LED Liquid Retina XDR display, and Thunderbolt.', 45000.00, 'iPad Pro 12.9-inch (5th Gen 2021).jpg', 3, 190, '2025-05-12 15:01:07'),
(61, 'iPad Pro 12.9-inch (6th Gen, 2022)', '6th-gen 12.9″ iPad Pro featuring M2 chip, Liquid Retina XDR, and 2TB storage option.', 52000.00, 'iPad Pro 12.9-inch (6th Gen, 2022).jpg', 3, 190, '2025-05-12 15:01:07'),
(62, 'Apple Watch Nike+ Edition', 'Apple Watch Nike+ Edition with exclusive Nike watch faces, breathable Sport Band, and GPS tracking.', 8000.00, 'Apple Watch Nike+ Edition.jpeg', 4, 25, '2025-05-12 15:01:45'),
(63, 'Apple Watch SE (2nd Generation)', 'Apple Watch SE (2nd Gen) featuring Retina display, fall detection, and advanced heart-rate monitoring.', 6500.00, 'Apple Watch SE (2nd Generation).jpeg', 4, 30, '2025-05-12 15:01:45'),
(64, 'Apple Watch Series 4', 'Apple Watch Series 4 with larger display, electrical heart sensor (ECG), and haptic feedback.', 7000.00, 'Apple Watch Series 4.jpg', 4, 20, '2025-05-12 15:01:45'),
(65, 'Apple Watch Series 5', 'Apple Watch Series 5 featuring always-on Retina display, built-in compass, and international emergency calling.', 9000.00, 'Apple Watch Series 5.jpeg', 4, 15, '2025-05-12 15:01:45'),
(66, 'Apple Watch Series 6', 'Apple Watch Series 6 with Blood Oxygen sensor, ECG app, and ultra-fast charging.', 10000.00, 'Apple Watch Series 6.jpeg', 4, 12, '2025-05-12 15:01:45'),
(67, 'Apple Watch Series 7', 'Apple Watch Series 7 featuring larger, more durable display and IP6X dust resistance.', 11000.00, 'Apple Watch Series 7.jpeg', 4, 18, '2025-05-12 15:01:45'),
(68, 'Apple Watch Series 8', 'Apple Watch Series 8 with temperature sensor, Crash Detection, and advanced health insights.', 12000.00, 'Apple Watch Series 8.jpeg', 4, 22, '2025-05-12 15:01:45'),
(69, 'Apple Watch Ultra', 'Apple Watch Ultra with 49mm titanium case, precision dual-frequency GPS, and 100m water resistance.', 22000.00, 'Apple Watch Ultra.jpeg', 4, 8, '2025-05-12 15:01:45'),
(70, 'AirPods v3 3rd', 'Apple AirPods (3rd generation) with spatial audio and MagSafe charging case.', 7500.00, 'AirPods v3 3rd.jpg', 5, 25, '2025-05-12 15:02:12'),
(71, 'Apple 20W USB-C Power Adapter', '20W USB-C Power Adapter for fast charging iPhone, iPad and AirPods.', 1200.00, 'Apple 20W USB-C Power Adapter.jpeg', 5, 40, '2025-05-12 15:02:12'),
(72, 'Apple Airpod cover 3rd', 'Silicone protective cover for 3rd generation AirPods charging case.', 350.00, 'Apple Airpod cover 3rd .jpeg', 5, 60, '2025-05-12 15:02:12'),
(73, 'Apple Airpod cover v1', 'Durable silicone cover for 1st generation AirPods charging case.', 300.00, 'Apple Airpod cover v1.jpg', 5, 55, '2025-05-12 15:02:12'),
(74, 'Apple AirPod v1 pro', 'First-generation AirPods Pro with active noise cancellation and wireless charging.', 8500.00, 'Apple AirPod v1 pro.jpeg', 5, 15, '2025-05-12 15:02:12'),
(75, 'Apple AirPods 3rd', 'Apple AirPods (3rd generation) with Adaptive EQ and sweat- and water-resistant design.', 7800.00, 'Apple AirPods 3rd.jpeg', 5, 30, '2025-05-12 15:02:12'),
(76, 'Apple AirPods Covers', 'Set of protective silicone covers for AirPods and AirPods Pro charging cases.', 400.00, 'Apple AirPods Covers.jpeg', 5, 70, '2025-05-12 15:02:12'),
(77, 'Apple AirPods Max Over-Ear Headphones', 'AirPods Max over-ear headphones with spatial audio and high-fidelity audio.', 22000.00, 'Apple AirPods Max Over-Ear Headphones.jpeg', 5, 12, '2025-05-12 15:02:12'),
(78, 'Apple AirPods Pro (2nd Generation)', 'AirPods Pro (2nd Gen) featuring improved noise cancellation and MagSafe case.', 9500.00, 'Apple AirPods Pro (2nd Generation).jpg', 5, 20, '2025-05-12 15:02:12'),
(79, 'Apple AirPods pro', 'Original AirPods Pro with active noise cancellation and transparency mode.', 9000.00, 'Apple AirPods pro.jpeg', 5, 18, '2025-05-12 15:02:12'),
(80, 'Apple AirPods v2 pro', 'AirPods Pro (1st Gen) upgraded with wireless charging case and H1 chip.', 8800.00, 'Apple AirPods v2 pro.jpg', 5, 22, '2025-05-12 15:02:12'),
(81, 'Apple AirTag Pro', 'Apple AirTag Pro with Precision Finding and IP67 water resistance.', 850.00, 'Apple AirTag Pro.jpg', 5, 45, '2025-05-12 15:02:12'),
(82, 'Apple AirTag v1', 'Apple AirTag (1st generation) item tracker with Bluetooth and U1 chip.', 800.00, 'Apple AirTag v1.jpeg', 5, 50, '2025-05-12 15:02:12'),
(83, 'Apple EarPods with Lightning Connector', 'EarPods with Lightning Connector for reliable audio and built-in microphone.', 650.00, 'Apple EarPods with Lightning Connector.jpeg', 5, 80, '2025-05-12 15:02:12'),
(84, 'Apple keyboard protect', 'Transparent silicone keyboard protector compatible with MacBook models.', 500.00, 'Apple keyboard protect.jpeg', 5, 70, '2025-05-12 15:02:12'),
(85, 'Apple keyboard', 'Apple Magic Keyboard with scissor mechanism and rechargeable battery.', 4500.00, 'Apple keyboard.jpeg', 5, 25, '2025-05-12 15:02:12'),
(86, 'Apple Magic Mouse', 'Apple Magic Mouse 2 with Bluetooth connectivity and rechargeable battery.', 3500.00, 'Apple Magic Mouse.jpeg', 5, 30, '2025-05-12 15:02:12'),
(87, 'Apple Pencil', 'Apple Pencil (1st generation) for precise drawing and note-taking on iPad.', 3200.00, 'Apple Pencil.jpeg', 5, 40, '2025-05-12 15:02:12'),
(88, 'Apple TrackPad', 'Apple Magic Trackpad with Force Touch and multi-gesture support.', 4800.00, 'Apple TrackPad.jpeg', 5, 20, '2025-05-12 15:02:12'),
(89, 'Apple TV', 'Apple TV HD streaming device with Siri Remote and access to Apple TV+ and apps.', 5500.00, 'Apple TV.jpg', 5, 35, '2025-05-12 15:02:12'),
(90, 'Apple Watch Ocean Band', 'Nike Ocean Band designed for Apple Watch Ultra with high-performance elastomer.', 2500.00, 'Apple Watch Ocean Band.jpeg', 5, 45, '2025-05-12 15:02:12'),
(91, 'Apple wireless charger', 'MagSafe Wireless Charger for iPhone 12 and later, with magnetic alignment.', 2000.00, 'Apple wireless charger.jpeg', 5, 50, '2025-05-12 15:02:12'),
(92, 'head phone pro', 'Over-ear Bluetooth headphones with built-in mic and active noise cancellation.', 2200.00, 'head phone pro.jpeg', 5, 28, '2025-05-12 15:02:12'),
(93, 'Ipad Case', 'Protective folio case for iPad with auto wake/sleep and built-in pencil holder.', 900.00, 'Ipad Case.jpeg', 5, 60, '2025-05-12 15:02:12'),
(94, 'iPhone 13 Pro Max Leather Case', 'Genuine leather case for iPhone 13 Pro Max with microfiber lining and MagSafe.', 1800.00, 'iPhone 13 Pro Max Leather Case.jpeg', 5, 35, '2025-05-12 15:02:12'),
(95, 'iPhone 13 Rugged Armor Protective Case', 'Heavy-duty rugged armor case for iPhone 13 with shock absorption.', 850.00, 'iPhone 13 Rugged Armor Protective Case.jpg', 5, 50, '2025-05-12 15:02:12'),
(96, 'iPhone 13 Silicone Case with MagSafe', 'Silicone case for iPhone 13 with MagSafe compatibility and silky finish.', 950.00, 'iPhone 13 Silicone Case with MagSafe.jpeg', 5, 45, '2025-05-12 15:02:12'),
(97, 'iPhone Charger with Lightning Cable', 'Standard Apple charger with 20W USB-C to Lightning cable included.', 1400.00, 'iPhone Charger with Lightning Cable.jpg', 5, 40, '2025-05-12 15:02:12'),
(98, 'iPhone Fast Charging Adapter', 'Apple 30W USB-C Power Adapter for fast charging iPhone and iPad.', 1800.00, 'iPhone Fast Charging Adapter.jpeg', 5, 30, '2025-05-12 15:02:12'),
(99, 'iPhone Wallet Case with Card Holder', 'Premium leather wallet case for iPhone with integrated card slots and MagSafe.', 1600.00, 'iPhone Wallet Case with Card Holder.jpeg', 5, 55, '2025-05-12 15:02:12'),
(100, 'Laptop Case', 'Slim protective laptop sleeve with water-resistant exterior and soft interior lining.', 1200.00, 'Laptop Case.jpeg', 5, 65, '2025-05-12 15:02:12'),
(101, 'Original Apple Charger USB-C', 'Genuine Apple USB-C power adapter for MacBook and iPad Pro fast charging.', 2000.00, 'Original Apple Charger USB-C.jpeg', 5, 45, '2025-05-12 15:02:12'),
(102, 'Slim Fit TPU Case for iPhone 13', 'Slim TPU protective case for iPhone 13 with anti-slip grip and shock protection.', 850.00, 'Slim Fit TPU Case for iPhone 13.jpeg', 5, 50, '2025-05-12 15:02:12'),
(103, 'wireless charger Fast', 'Fast wireless charging pad compatible with Qi-enabled devices and LED indicator.', 1100.00, 'wireless charger Fast.jpg', 5, 40, '2025-05-12 15:02:12');

CREATE TABLE users (
  user_id int(10) UNSIGNED NOT NULL,
  name varchar(100) NOT NULL,
  email varchar(100) NOT NULL,
  password varchar(255) NOT NULL,
  role enum('customer','admin') DEFAULT 'customer',
  created_at timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO users (user_id, name, email, password, role, created_at) VALUES
(1, 'Admin User', 'admin@techcorner.com', '$2y$10$e0NRGCEz3WZ7Pio/EFlgJukWvY1mTZ/nuwBMT3yD8/jJ1I3PiHDyW', 'admin', '2025-05-12 14:57:11'),
(2, 'John Doe', 'john@example.com', '$2y$10$e0NRGCEz3WZ7Pio/EFlgJukWvY1mTZ/nuwBMT3yD8/jJ1I3PiHDyW', 'customer', '2025-05-12 14:57:11'),
(3, 'Joe', 'Joe@.com', '0000', 'customer', '2025-05-12 15:14:08'),
(4, 'John Doe', 'john.doe@example.com', 'hashed_password_here', 'customer', '2025-05-12 16:34:46');

