-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2018 at 05:29 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `istore`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE `admin_role` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL,
  `admin_role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE `attribute` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_value`
--

CREATE TABLE `attribute_value` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Apple', NULL),
(2, 'Samsung', NULL),
(3, 'Mới', NULL),
(4, 'Sale', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment_detail`
--

CREATE TABLE `comment_detail` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `detail` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `percent_off` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `code`, `type`, `value`, `percent_off`, `is_active`) VALUES
(1, 'PUDDIN50', 'percent', NULL, 50, 1),
(2, 'PUDDIN20', 'fixed', 200000, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_04_24_072518_create_shoppingcart_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shipping_info_id` int(11) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `comment` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `shipping_info_id`, `payment_id`, `discount_id`, `subtotal`, `tax`, `total`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 15, 1, 2, 19980000, 1998000, 21778000, NULL, 0, '2018-04-29 06:59:37', '2018-04-29 06:59:37'),
(4, 1, 16, 2, 1, 149720000, 14972000, 164692000, NULL, 0, '2018-04-29 07:25:29', '2018-04-29 07:25:29'),
(5, 1, 17, 2, NULL, 0, 0, NULL, NULL, 0, '2018-04-29 07:25:54', '2018-04-29 07:25:54'),
(6, 2, 18, 1, 2, 106300000, 10630000, 116730000, NULL, 0, '2018-04-29 23:52:15', '2018-04-29 23:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `name`) VALUES
(1, 'cash'),
(2, 'paypal');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT '0',
  `thumbnail` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `unit_price`, `promotion_price`, `thumbnail`) VALUES
(1, 'iPhone X 64G', '<div class=\"box-article\">\r\n        <h3><strong>Màn hình OLED hỗ trợ HDR</strong></h3>\r\n\r\n<p>Màn hình OLED có hỗ trợ HDR là một sự nâng cấp mới của Apple thay vì màn hình LCD với IPS được tìm thấy trên iPhone 8 và iPhone 8 Plus đem đến tỉ lệ tương phản cao hơn đáng kể là 1.000.000: 1, so với 1.300: 1 ( iPhone 8 Plus ) và 1.400: 1 ( iPhone 8 ).</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/iphone-x.jpg\" style=\"height:533px; width:800px\"></p>\r\n\r\n<p>Màn hình OLED mà Apple đang gọi màn hình Super Retina HD có thể hiển thị tông màu đen sâu hơn. Điều này được thực hiện bằng cách tắt các điểm ảnh được hiển thị màu đen còn màn hình LCD thông thường, những điểm ảnh đó được giữ lại. Không những thế, màn hình OLED có thể tiết kiệm pin đáng kể.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/apple-091217-iphone-x.jpg\" style=\"height:533px; width:800px\"></p>\r\n\r\n<h3><strong>Chống rung OIS kép và camera có khẩu độ lớn hơn</strong></h3>\r\n\r\n<p>Cả ba mẫu iPhone mới đều có camera sau 12MP và 7MP cho camera trước, nhưng chỉ iPhone X và iPhone 8 Plus có thêm một cảm biến cho camera sau. Camera kép trên máy như thường lệ: một góc rộng và một tele. Vậy Apple đã tích hợp những gì vào camera của iPhone X?</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/apple-091217-iphone-x-4125%3D.jpg\" style=\"height:533px; width:800px\"></p>\r\n\r\n<p>Chống rung quang học (OIS) là một trong những tính năng được nhiều hãng điện thoại trên thế giới áp dụng. Đối với iPhone X, hãng tích hợp chống rung này cho cả hai camera, không như IPhone 8 Plus chỉ có OIS trên camera góc rộng nên camera tele vẫn rung và chất lượng bức hình không đảm bảo.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/apple-091217-iphone-x3978_1170x780-800-resize.jpg\" style=\"height:533px; width:800px\"></p>\r\n\r\n<p>Thứ hai, ống kính tele của iPhone 8 Plus có khẩu độ f / 2.8, trong khi iPhone X có ống kính tele f / 2.2, tạo ra một đường cong nhẹ và có thể chụp thiếu sáng tốt hơn với ống kính tele trên iPhone X.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/apple-091217-iphone-x4001_1170x780-800-resize.jpg\" style=\"height:533px; width:800px\"></p>\r\n\r\n<h3><strong>Portrait Mode với Camera trước</strong></h3>\r\n\r\n<p>Portrait Mode là tính năng chụp ảnh xóa phông trước đây chỉ có với camera sau của iPhone 7 Plus, hiện được tích hợp trên cả iPhone 8 Plus và iPhone X. Tuy nhiên, nhờ sức mạnh của cảm biến trên mặt trước của iPhone X, Camera TrueDepth cũng có thể chụp với Potrait mode.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/camera%20trc.png\" style=\"height:333px; width:600px\"></p>\r\n\r\n<h3><strong>Portrait Lightning Mode với camera trước</strong></h3>\r\n\r\n<p>Không dừng lại ở đó, Portrait Lightning - tính năng quét khuôn mặt mới, tính toán các phản ứng của khuôn mặt bạn với các tình huống ánh sáng khác nhau để tạo hiệu ứng sáng - thực hiện bởi camera TrueDepth ở phía trước.</p>\r\n\r\n<p>Tính năng này sẽ đưa ảnh chân dung lên một tầm cao mới, không chỉ phân biệt nền và chủ thể, máy sẽ ghép chủ thể với các nền khác nhau như tự nhiên, studio, ánh sáng sân khấu...</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/cam%20truoc.jpg\" style=\"height:361px; width:641px\"></p>\r\n\r\n<h3><strong>Face ID</strong></h3>\r\n\r\n<p>Face ID là một trong những tính năng quan trọng nhất của chiếc Smartphone chủ đạo lần này. Màn hình iPhone X tràn rộng ra toàn bộ diện tích máy, chỉ để lại một thanh nhỏ trên đỉnh, trong đó có một bộ cảm biến bao gồm máy ảnh TrueDepth mới. Điều này có nghĩa là không còn cảm biến Touch ID huyền thoại và được thay thế bằng nhận diện khuôn mặt.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/face%20id.png\" style=\"height:450px; width:800px\"></p>\r\n\r\n<p>Thay vào đó, chỉ với iPhone X, bạn sẽ phải sử dụng Face ID để mở khóa vào điện thoại của bạn. Máy sử dụng camera hồng ngoại, một đèn chiếu và cảm biết chấm với hơn 30.000 điểm không nhìn thấy được để xây dựng và đối chiếu tất cả đường nét trên khuôn mặt của bạn. Và do không còn Touch ID, bạn sẽ sử dụng Face ID để xác thực việc mua hàng với Apple Wallet.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/face%20id%20new.png\" style=\"height:450px; width:800px\"></p>\r\n\r\n<p>Face ID cũng có thể hiểu được bạn có muốn đăng nhập vào điện thoại hay không, điều đó có nghĩa là nó sẽ không unlock màn hình khóa khi bạn chưa muốn, chẳng hạn như khi bạn đọc thông báo.</p>\r\n\r\n<p>Vì sử dụng những công nghệ phức tạp nên iPhone 8 và 8 Plus sẽ không thể sử dụng được. Nhưng chí ít vẫn con Touch ID trên đó.</p>\r\n\r\n<h3><strong>Animoji</strong></h3>\r\n\r\n<p>Animoji là tính năng sử dụng máy ảnh TrueDepth để đọc và phân tích \"hơn 50 chuyển động khác nhau\" để phản chiếu biểu hiện của bạn trên 12 Anoichi khác nhau (hoặc hình ảnh động). Hãy suy nghĩ về các bộ lọc khuôn mặt động vật của Snapchat, nhưng thay vì đặt chồng lên một hình ảnh trên khuôn mặt của bạn, các cử chỉ mặt của bạn được bắt chước bởi một emoji!</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/menoj.png\" style=\"height:450px; width:800px\"></p>\r\n\r\n<p>Animoji được tạo trong Tin nhắn và đồng thời cũng có thể ghi âm. Animoji được thể hiện và ghi lại giọng nói của bạn và gửi có thể gửi cho người khác qua tin nhắn.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/emijii.jpg\" style=\"height:533px; width:800px\"></p>\r\n\r\n<h3><strong>Thời lượng sử dụng pin lâu hơn</strong></h3>\r\n\r\n<p>Tạm gác qua những tính năng mới tích hợp, iPhone X thực sự có thời lượng sử dụng pin tốt hơn so với iPhone 8.</p>\r\n\r\n<p>Tại sự kiện, chúng ta không thấy Apple tiết lộ trải nghiệm sử dụng pin trong điện thoại của mình, nhưng hãng có nói rằng iPhone 8 sẽ có trải nghiệm pin tương tự iPhone 7, nên iPhone 8 Plus sẽ tương tự như iPhone 7 Plus. Quan trọng nhất là hãng công bố rằng iPhone X có thể kéo dài hơn 2 giờ so với iPhone 7.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/thoi%20luong%20pin%20lau%20hon.png\" style=\"height:464px; width:508px\"></p>\r\n\r\n<p>Với tất cả những điều này, bạn chỉ cần làm một số thủ thuật đơn giản với màn hình OLED như sử dụng hình nền tĩnh hay bật chế độ ban đêm với một số ứng dụng... bạn sẽ tiết kiệm được kha khá thời gian sử dụng trên iPhone X</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/apple-091217-iphone-x-4120_1170x780-800-resize.jpg\" style=\"height:533px; width:800px\"></p>\r\n\r\n    </div>', 24890000, 0, 'iphone-x-silver-select-2017.jpg'),
(2, 'iPad 2017 32GB Wifi + 4G', '<div class=\"box-article\">\r\n        <p style=\"text-align:justify\">iPad 2017 32GB ra mắt thị trường vào tháng 3/2017. Sở hữu nhiều ưu điểm kế thừa từ các thế hệ trước đây, thiết bị mới này hứa hẹn đem đến cho người dùng nhiều trải nghiệm thú vị chưa từng có.</p>\r\n\r\n<h2 style=\"text-align:justify\">Đặc điểm nổi của iPad 2017 32Gb</h2>\r\n\r\n<h3 style=\"text-align:justify\">Chất lượng hiển thị tuyệt vời</h3>\r\n\r\n<p style=\"text-align:justify\">iPad 2017 được trang bị màn hình kích thước 9.7 inches mang đến những trải nghiệm chân thực nhất khi bạn xem phim, nghe nhạc, chơi game, shopping online hay lướt web…</p>\r\n\r\n<p style=\"text-align:justify\"><img alt=\"\" src=\"/Uploads/PostImages/images/ipad-2017-1.png\"></p>\r\n\r\n<p style=\"text-align:justify\">Ngoài ra, tấm nền Retina được Apple sử dụng có độ phân giải cao lên đến 2048 x 1536 pixels cho hiển thị rõ nét hơn. Lớp không thấm dầu phủ trên màn hình của iPad giúp tăng góc nhìn và chống phản xạ khi hiển thị nội dung.</p>\r\n\r\n<p style=\"text-align:justify\">Không chỉ thế, khi sử dụng ngoài trời dưới cường độ ánh sáng cao, màn hình của iPad 2017 dễ nhìn hơn hẳn so với mà hình iPad Air 2 do độ sáng cao hơn.</p>\r\n\r\n<h3 style=\"text-align:justify\">Tốc độ xử lý tác vụ nhanh và mượt mà</h3>\r\n\r\n<p style=\"text-align:justify\">Sở hữu con chip A9 có tốc độ&nbsp;nhanh gấp 1.6 lần và xử lý đồ họa gấp 1.8 lần so với chip A8, iPad 2017&nbsp;xử lý tác vụ nhanh hơn hẳn iPad mini 4 và iPad Air 2. Chưa hết, chip A9 còn giúp kéo dài thời lượng sử dụng thiết bị nhờ tính năng tiết kiệm năng lượng và tỏa nhiệt ít.</p>\r\n\r\n<p style=\"text-align:justify\"><img alt=\"\" src=\"/Uploads/PostImages/images/new-ipad-2017-unboxing-hero1.png\"></p>\r\n\r\n<h3 style=\"text-align:justify\">Camera ấn tượng</h3>\r\n\r\n<p style=\"text-align:justify\">Thế hệ iPad này được trang bị camera iSight với nhiều cải tiến. Camera sau có độ phân giải 8MP và cảm biến hình ảnh BSI giúp ghi lại những bức ảnh đầy đủ chi tiết ngay cả khi chụp trong điều kiện thiếu sáng. Người dùng còn có thể trải nghiệm nhiều tính năng camera mới như chế độ chụp hẹn giờ, chế độ quay video chậm slow-motion và chế độ chụp toàn cảnh.</p>\r\n\r\n<p style=\"text-align:justify\"><img alt=\"\" src=\"/Uploads/PostImages/images/iPad-2017.png\"></p>\r\n\r\n<p style=\"text-align:justify\">Không chỉ riêng camera chính, camera trước của thiết bị này cũng được cải tiến với cảm biến BSI và tính năng HDR giúp bạn có được những bức ảnh selfie lung linh và những cuộc gọi video chất lượng cao.</p>\r\n\r\n<h3 style=\"text-align:justify\">Thiết kế mỏng, nhẹ</h3>\r\n\r\n<p style=\"text-align:justify\">iPad 2017 32GB được thiết kế để thuận tiện khi mang theo với độ dày chỉ 7.5mm và trọng lượng chỉ 469 grams. Vỏ kim loại bao trọn thân máy tạo cảm giác chắc chắn và sang trọng.</p>\r\n\r\n<p style=\"text-align:justify\"><img alt=\"\" src=\"/Uploads/PostImages/images/iPad-2017-2.png\"></p>\r\n\r\n    </div>', 9990000, 0, 'affordable_new_9-7-inch_ipad_group_twist.jpg'),
(3, 'Samsung Galaxy Note8 Tím Khói Chính Hãng', '<p>\r\n    <strong>Thiết kế cao cấp</strong></p>\r\n\r\n<p>Sự cải tiến trong thiết kế của Galaxy Note8 với màn hình vô cực 6.3 inch. Đây là kích thước lớn nhất từng có trên các dòng Galaxy Note - màn hình lớn hơn mang đến góc nhìn rộng hơn và nhiều không gian hơn để sử dụng S Pen. Và với thiết kế đường cong cân đối tỷ lệ 18.5:9,&nbsp;điện thoại vẫn sẽ vừa vặn trong tay bạn.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/note8-960x540.jpg\"></p>\r\n\r\n<p>Galaxy Note8 được thiết kế để sử dụng dễ dàng và đơn giản. Thiết kế nguyên khối với đường cong hoàn hảo đem lại sự thoải mái khi cầm nắm và tạo nhiều không gian hơn để sử dụng S Pen. Cảm biến vân tay được chuyển ra mặt sau điện thoại, và nút Home đặt ẩn bên dưới màn hình vô cực chỉ hiển thị khi bạn cần,&nbsp;\r\n    <br> mang lại trải nghiệm mượt mà nhất.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/note8%20thiet%20ke%20tien.PNG\"></p>\r\n\r\n<p><strong>Tốc độ vượt trội</strong></p>\r\n\r\n<p>Trải nghiệm game đồ họa đỉnh cao và chuyển đổi giữa các ứng dụng mượt mà. Galaxy Note8 với vi xử lí 10nm cùng 6GB RAM mạnh mẽ giúp vận hành mọi tác vụ liên tục và siêu tốc.<img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/cau%20hinh%20note8.jpg\"></p>\r\n\r\n<p><strong>Dữ liệu được xử lí với tốc độ Gigabit</strong></p>\r\n\r\n<p>Duyệt web, tải dữ liệu và xem video với tốc độ cao trở nên nhanh chóng, dễ dàng hơn. Galaxy Note8 hỗ trợ đồng thời Gigabit LTE và Gigabit Wi-Fi mang lại cho bạn tốc độ kết nối ưu việt,&nbsp;\r\n    <br> khai thác mạng tốc độ cao đến 1 gigabit/giây.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/note8%20toc%20do%20cao.PNG\"></p>\r\n\r\n<p><strong>Trải nghiệm trò chơi tốc độ cao</strong></p>\r\n\r\n<p>Nhờ có nền tảng Vulkan, các trò chơi nặng đồ họa trở nên nhẹ nhàng hơn với Galaxy Note8. Nền tảng Vulkan hỗ trợ kết nối nhanh chóng giữa xử lí và đồ họa mang đến cho người dùng trải nghiệm mượt mà nhưng vẫn đảm bảo tiết kiệm pin tối đa.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/galaxy-note8_gaming.png\"></p>\r\n\r\n<p><strong>Bộ đôi camera kép mang đến những hình ảnh sống động, chân thực</strong></p>\r\n\r\n<p>Samsung Galaxy Note8 sở hữu cụm camera kép 12 MP. Camera thứ nhất có khẩu độ F/1.7 và camera thứ hai là F/2.4 có khả năng Zoom quang học 2X. Cả 2 camera này đều được trang bị công nghệ ổn định hình ảnh quang học OIS tiên tiến. Samsung năm nay đầu tư rất mạnh vào camera cả về phần mềm và phần cứng. Chúng ta sẽ có thêm nhiều các tính năng để trải nghiệm cụm camera này.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/camera.PNG\"></p>\r\n\r\n<p>Với tính năng xoá phông chủ động Live Focus, người dùng sẽ có thể kiểm soát tối đa độ sâu của hình chụp để tạo ra các hiệu ứng bokeh theo ý muốn.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/tu%20dong%20lay%20net.PNG\"></p>\r\n\r\n<p>Tính năng nổi bật thứ hai là Dual Camera. Tính năng này cho phép cả hai camera chính hoạt động đồng thời, cùng chụp và lưu một bức ảnh. Trong đó, một bức chụp cận cảnh từ ống kính tele và một bức chụp góc rộng cho thấy toàn bộ khung cảnh nền.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/2%20camera.PNG\"></p>\r\n\r\n<p>Công nghệ Dual Pixel vẫn được tích hợp lên camera của Galaxy Note8 giúp máy bắt nét nhanh hơn và đặc biệt chụp tốt hơn trong các điều kiện thiếu sáng.</p>\r\n\r\n<p>Ngoài ra Samsung cũng quan tâm đến nhu cầu chụp ảnh selfie khi trang bị cho camera phụ trên Galaxy Note8 một cảm biến 8 MP, khẩu độ cùng F/1.7.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/thach%20thuc%20bong%20dem.PNG\"></p>\r\n\r\n<p><strong>2 dải loa và chip DAC cho trải nghiệm nghe nhạc đỉnh cao</strong></p>\r\n\r\n<p>Samsung Galaxy Note8 được tin là sẽ có hai dải loa, và cũng tương tự như với bộ đôi Galaxy S8/S8 Plus, bất kỳ ai tậu cho mình một chiếc Galaxy Note8 sẽ được tặng kèm trong hộp một đôi tai nghe của AKG. Nó cũng trùng khớp với các tấm hình phác thảo máy trước đó với một dải loa nằm ở đỉnh máy và một nằm phía dưới.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/galaxy-note-8(1).jpg\"></p>\r\n\r\n<h3><strong>Tính năng đặc biệt</strong></h3>\r\n\r\n<p><strong>Chống nước chuẩn IP68</strong></p>\r\n\r\n<p>Khả năng chống nước là tính năng không thể thiếu trên Galaxy Note8. Với tiêu chuẩn IP68, máy có thể hoạt động bình thường dưới nước trong 30 phút ở độ sâu 1.5 mét. Và đặc biệt hơn, tính năng này sẽ cho phép người dùng sử dụng bút S-Pen ngay cả khi màn hình dính nước.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/chong%20nuoc.PNG\"></p>\r\n\r\n<p><strong>Quét mống mắt</strong></p>\r\n\r\n<p>Bên cạnh cảm biến vân tay được đặt ở phía sau máy, Samsung cũng tích hợp cho Galaxy Note8 công nghệ quét mống mắt hiện đại, tăng cường bảo mật cho thiết bị và đảm bảo an toàn cho người dùng. Tốc độ nhận dạng rất nhanh, chính xác và đặc biệt hoạt động rất tốt trong bóng tối.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/bao%20mat.PNG\"></p>\r\n\r\n<p><strong>Samsung Dex</strong></p>\r\n\r\n<p>Tính năng này sẽ biến chiếc Galaxy Note8 của bạn trở thành một chiếc máy tính để bàn. Theo đó bạn có thể lưu trữ các tệp trên thiết bị,thực hiện công việc khi đang di chuyển và sử dụng Samsung DeX khi bạn cần một màn hình lớn hơn.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/galaxy-note8_dex.jpg\"></p>\r\n\r\n<p><strong>Trợ lí ảo Bixby</strong></p>\r\n\r\n<p>Galaxy Note8 bao gồm trợ lý ảo Bixby giúp người dùng sử dụng điện thoại thông minh hơn. Bixby sẽ học thói quen sử dụng điện thoại của bạn, không ngừng được cải thiện và giúp bạn làm được nhiều việc hơn.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/galaxy-note8_bixby.jpg\"></p>\r\n\r\n<p><strong>Bút S-Pen</strong></p>\r\n\r\n<p>So với thế hệ trước, bút S-Pen trên Galaxy Note 8 năm nay được nâng cấp rất mạnh.Nó sẽ lần đầu tiên kết hợp với màn hình vô cực để đem đến những trải nghiệm tuyệt vời cho người dùng.\r\n    <br>\r\n    <img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/spen.PNG\"></p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/photo-6-1503501307905.jpg\"></p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/photo-0-1503504520112.jpg\"></p>\r\n\r\n<p><strong>Live Message</strong></p>\r\n\r\n<p>Tính năng này sẽ giúp người dùng thể hiện được hết ý tưởng của mình với đối tác thay vì việc giao tiếp bằng văn bản như thông thường. Cây bút S-Pen cho phép người dùng chia sẻ các tin nhắn động hoặc các bản vẽ định dạng GIF để làm cuộc nói chuyện trở nên thú vị hơn.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/live%20mess.gif\"></p>\r\n\r\n<p><strong>Pin</strong></p>\r\n\r\n<p>Samsung luôn đặt sự an toàn của người dùng lên hàng đầu. Đó là lí do Galaxy Note8 được trang bị viên pin có dung lượng 3300 mAh. Viên pin này không qúa cao nhưng vẫn đảm bảo cho người dùng một ngày sử dụng thoải mái.</p>\r\n\r\n<p>Ngoài ra, Samsung Galaxy Note8 cũng được trang bị công nghệ sạc nhanh Quick Charge 2.0 giúp máy sạc nhanh hơn, tiết kiệm thời gian của bạn.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.dienthoaididong.com/Uploads/PostImages/images/sac%20khong%20day.PNG\"></p>\r\n\r\n<p>\r\n    <button title=\"Close (Esc)\" type=\"button\">×</button>\r\n</p>', 22490000, 19990000, 'note8 tim khoi.jpg'),
(4, 'Macbook Air 13\" 256GB MQD42', '<div class=\"box-article\">\r\n    <p>Macbook Air 13inch 128GB là thiết bị&nbsp;hội tụ đầy đủ tính năng mà người dùng mong&nbsp;đợi ở một chiếc máy tính xách tay: mỏng, nhẹ, thời lượng pin dài, được trang bị công nghệ mới nhất hiện nay.</p>\r\n\r\n    <h2>Đặc điểm nổi bật của&nbsp;Macbook Air 13inch 128GB MQD32</h2>\r\n\r\n    <h3>Dung lượng pin khủng</h3>\r\n\r\n    <p>Macbook Air có viên pin khá lớn. Phiên bản 13 inch cho phép người dùng sử dụng thoải mái trong vòng 12 giờ sau mỗi lần sạc đầy. Nếu bạn&nbsp;đặt MacBook Air vào chế độ ngủ hơn 3 giờ thì nó sẽ tự kích hoạt chế độ tiết kiệm pin với thời gian chờ 30 ngày. Và nếu bạn kích hoạt Power Nap, bạn tiếp tục nhận được email và lịch mời ngay cả khi máy đang ngủ.</p>\r\n\r\n    <p><img alt=\"\" src=\"/Uploads/PostImages/images/01.jpg\"></p>\r\n\r\n    <h3>Bộ vi xử lý Intel Core thế hệ thứ tư với nhiều cải tiến</h3>\r\n\r\n    <p>MacBook Air được trang bị&nbsp;bộ xử lý thế hệ&nbsp;thứ tư Core i5 và Core i7 từ Intel. Bộ xử lý này được thiết kế để thiết bị tiêu tốn ít điện năng hơn trong khi vẫn mang đến hiệu năng kinh ngạc.</p>\r\n\r\n    <p><img alt=\"\" src=\"/Uploads/PostImages/images/design_unibody2.jpg\"></p>\r\n\r\n    <p>Không chỉ vậy, bộ xứ lý đồ họa Intel HD Graphics 6000 cho Macbook Air&nbsp;hiệu năng cao hơn 40% so với thế hệ trước. Nhờ đó, bạn sẽ thấy mượt mà hơn hẳn&nbsp;khi chơi game hoặc sử dụng những ứng dụng đồ họa nặng.</p>\r\n\r\n    <h3>Tốc độ Wi-Fi nhanh hơn 3 lần</h3>\r\n\r\n    <p>Hỗ trợ chuẩn Wi-Fi&nbsp;802.11 ac cho hiệu năng Wi-Fi nhanh&nbsp;gấp 3 lần so với thế hệ Macbook Air trước.&nbsp;Ngoài ra, với công nghệ Bluetooth, bạn có thể kết nối MacBook Air với các thiết bị Bluetooth khác như loa hoặc tai nghe. Ngay cả khi không sử dụng dây, bạn gần như lúc nào cũng được kết nối.</p>\r\n\r\n    <p><img alt=\"\" src=\"/Uploads/PostImages/images/features_keyboard_backlit.png\"></p>\r\n\r\n    <h3>Thunderbolt và USB 3</h3>\r\n\r\n    <p>Với cổng Thunderbolt nhanh như chớp, bạn có thể kết nối MacBook Air tới những thiết bị mới nhất như Apple Thunderbolt Display. Chưa dừng ở đó, MacBook Air đi kèm 2 cổng USB 3 hỗ trợ bất kỳ thiết bị USB 3 và 2 nào. Chỉ với vài kết nối, MacBook Air biến từ một máy tính xách tay siêu di động thành một trạm làm việc.</p>\r\n\r\n    <p><img alt=\"\" src=\"/Uploads/PostImages/images/features_thunderbolt_main.jpg\"></p>\r\n\r\n    <h3>Màn hình hiển thị sắc nét</h3>\r\n\r\n    <p>Xét về mọi phương diện, màn hình của&nbsp;MacBook Air là một kỳ tích về thiết kế và công nghệ. Màn hình của MacBook Air 13 inch có độ phân giải&nbsp;1440 x 900 pixel, cao hơn hẳn so với độ phân giải màn hình của Macbook Air 11. Màn hình chỉ mỏng 4.86mm nhưng có độ phân giải cao khiến bạn có cảm giác&nbsp;như&nbsp;đang xem màn hình to hơn. Đèn nền LED cho màu sắc sáng và tươi hơn. Vì thế khi bạn chỉnh sửa hình ảnh, trình chiếu hoặc xem phim, bạn sẽ yêu thích những gì bạn trông thấy.</p>\r\n\r\n    <h3>Camera sắc nét, micro thu âm tốt</h3>\r\n\r\n    <p>Macbook Air sở hữu camera FaceTime HD 720p&nbsp;cho phép bạn nhìn thấy hình ảnh&nbsp;bạn bè, người thân sống động và rõ nét hơn khi gọi điện Facetime. Hơn thế, màn hình rộng cho phép bạn nhìn rõ tất cả mọi người trong các cuộc gọi nhóm.</p>\r\n\r\n    <p><img alt=\"\" src=\"/Uploads/PostImages/images/features_display_main.jpg\">\r\n        <br> Bên cạnh đó, cặp micro được Apple trang bị cho Macbook Air giúp thu âm tốt để người đối thoại nghe thấy giọng nói của bạn chân thực hơn. Khả năng giảm tiếng ồn đến mức tối đa cho chất lượng âm thanh rõ nét.</p>\r\n\r\n    <h3>Bàn phím có đèn nền</h3>\r\n\r\n    <p>Đèn nền được trang bị cho bàn phím hỗ trợ bạn thao tác dễ dàng ngay cả ở những nơi thiếu sáng.&nbsp;Nhờ bộ phận cảm biến, đèn nền sẽ tự động&nbsp;thay đổi độ sáng tùy thuộc vào ánh sáng&nbsp;bên ngoài. Thêm vào đó, mặc dù vô cùng gọn nhẹ,&nbsp;MacBook Air vẫn sở hữu một bàn phím full-size giúp việc đánh chữ vô cùng tự nhiên và thoải mái.&nbsp;</p>\r\n\r\n    <p><img alt=\"\" src=\"/Uploads/PostImages/images/features_multitouch.jpg\"></p>\r\n\r\n    <h3>Trackpad cảm ứng đa điểm</h3>\r\n\r\n    <p>Trackpad đa điểm rộng rãi được thiết kế dành riêng cho cảm ứng. Cảm ứng&nbsp;cực nhạy cho bạn cảm giác&nbsp;trung thực mỗi khi thao tác cuộn trang web&nbsp;lên hoặc xuống hay chuyển&nbsp;từ ứng dụng toàn màn hình này sang ứng dụng khác. Bạn cảm giác như mình đang chạm vào chúng vậy.</p>\r\n\r\n    <p>&nbsp;</p>\r\n\r\n</div>', 24890000, 0, 'Apple Macbook Air - MQD42..jpg'),
(5, 'Smart Keyboard iPad Pro 10.5', 'Smart Keyboard iPad Pro 10.5', 4550000, 0, 'Smart Keyboard iPad Pro 10.5 .3.jpg'),
(6, 'Samsung Galaxy S9 Plus Black 128 GB Chính hãng', '<div class=\"box-article\">\r\n        <p>Galaxy S9+ là dòng smartphone cao cấp vừa được Samsung giới thiệu trên thị trường, đen đến nhiều cải tiến đáng giá so với bản tiền nhiệm S8+. Cụ thể, máy được trang bị camera có khả năng thay đổi khẩu độ đầu tiên trên thế giới, tính năng AR Emoji, bảo mật đồng thời bằng khuôn mặt và mống mắt...</p>\r\n\r\n<p><b>Thiết kế sang trọng, cao cấp:</b></p>\r\n\r\n<p>Samsung Galaxy S9/S9+ có kiểu dáng thời trang và cực kỳ cao cấp bằng chất liệu kính bóng bẩy, kết hợp với khung kim loại chắc chắn. Bạn sẽ được cầm trên tay chiếc điện thoại màn hình vô cực rộng lớn nhưng kích thước vẫn hết sức gọn gàng. Một màn hình cực lớn, cong tràn vô cực về hai phía và nối liền với mặt sau mang đến trải nghiệm liền mạch, phá vỡ mọi giới hạn trên Galaxy S9/S9+.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/danh_gia_chi_tiet_samsung_galaxy_s9_11.jpg\"></p>\r\n\r\n<p>Thiết kế cải tiến cũng mang lại cụm cảm biến vân tay mới, nó ngắn hơn đáng kể so với các cảm biến vân tay trên điện thoại khác, lại đặt ở vị trí không thật sự thuận tiện là phía dưới camera. Mình thường xuyên chạm vào phần camera của máy, làm bám vân tay rất nhiều trên đó. Galaxy S9+ còn đỡ chứ S9 thì có lẽ sẽ tệ hơn, trừ các bạn tay rất nhỏ. Trên thực tế thì mình hiếm khi sử dụng cảm biến này, bởi vì tính năng quét thông minh Intelligent Scan hoạt động khá hiệu quả. Intelligent Scan sẽ tự động chuyển đổi giữa cảm biến mống mắt (an toàn hơn nhưng chậm) và nhận diện khuôn mặt (kém bảo mật nhưng nhanh) để các bạn có thể mở khóa nhanh nhất có thể.<br>\r\n<img alt=\"\" src=\"/Uploads/PostImages/images/danh_gia_chi_tiet_samsung_galaxy_s9_7.jpg\"><img alt=\"\" src=\"/Uploads/PostImages/images/danh_gia_chi_tiet_samsung_galaxy_s9_1.jpg\"></p>\r\n\r\n<p><strong>Camera Galaxy S9 có thể thay đổi tiêu cự</strong></p>\r\n\r\n<p>Có thể nói camera chính là yếu tố Samsung nhấn mạnh trên Galaxy S9 lần này, vẫn sở hữu camera chính 12 MP - khẩu độ F/1.5, cải tiến với công nghệ lấy nét Dual Pixel 2.0 mới. Đặc biệt có thể thay đổi khẩu độ tuỳ theo ý thích tương tự như trên các máy DSLR hay Mirrorless.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/bgr-samsung-gs9-7_1280x853-800-resize.jpg\"></p>\r\n\r\n<p>Nếu có hai điểm ấn tượng nhất về camera S9, thì đó chính là ống kính khẩu độ kép f1.5 và khả năng quay phim 960fps. Điểm thứ nhất gây ấn tượng về mặt kỹ thuật phần cứng trong khi điểm thứ hai là về tư tưởng, một tư tưởng hoàn toàn khác của Samsung mà mình có chia sẻ ở đầu bài.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/4264222_tinhte_camera_samsung_galaxy_s9_4.jpg\"></p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/camera_samsung_galaxy_s9_1(1).jpg\"><br>\r\n<br>\r\nVề khẩu độ f1.5, nếu chỉ có điểm này thì đối với mình Galaxy S9 cũng chỉ bình thường thôi. Khác biệt là ở chỗ Samsung đã trang bị thêm một vòng khẩu ở bên ngoài, và chính vòng khẩu này tạo nên sự khác biệt. Vòng khẩu này về bản chất giống với các ống kính kiểu Lens Baby trước kia, hay việc bạn cắt dán các ngôi sao gắn vòng ngoài để tạo hiệu ứng. Chính vòng khẩu này là yếu tố tiên quyết làm cho hiệu ứng bokeh hay phần background của S9/S9+ mờ nhiều hơn và hiệu ứng chuyển mềm hơn, dịu hơn rất nhiều, giảm cảm giác bị gắt.<br>\r\n<img alt=\"\" src=\"/Uploads/PostImages/images/4264234_tinhte_camera_samsung_galaxy_s9_16.jpg\"></p>\r\n\r\n<p><strong>Biểu cảm khuôn mặt AR Emoji</strong></p>\r\n\r\n<p>Tính năng hoàn toàn mới trên Samsung S9 cho phép người dùng tự tạo nên những biểu tượng cảm xúc từ chính khuôn mặt, cảm xúc của mình, chia sẻ nhanh với bạn bè vui vẻ và đặc biệt hơn rất nhiều.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/samsung-galaxy-s9-ar-emoji.gif\"></p>\r\n\r\n<h3>Cấu hình vẫn mạnh mẽ, hỗ trợ tốt AI&nbsp;</h3>\r\n\r\n<p>Samsung Galaxy S9 năm nay tiếp tục được sở hữu vi xử lý mới nhất Exynos&nbsp;9810 chú trọng nhiều hơn về trí tuệ nhân tạo AI, đồng thời xử lý các tác vụ nặng khác như quay Super Slowmotion 960 khung hình/giây, AR Emoji,... Bộ nhớ RAM đạt 4 GB và bộ nhớ trong 64 GB.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/s9%2B%20cau%20hinh%20cao.jpg\"></p>\r\n\r\n<h3>Đắm chìm trong thế giới âm nhạc</h3>\r\n\r\n<p>Lần đầu tiên bạn sẽ được trải nghiệm âm thanh tuyệt hảo với loa kép đẳng cấp từ hãng âm thanh danh tiếng AKG. Loa ngoài của Galaxy S9/S9+ sẽ lớn, mạnh mẽ, sắc nét và ấn tượng hơn. Ngoài ra, hệ thống âm thanh vòm giả lập Dolby Atmos còn cho bạn chất lượng như trong rạp hát đầy sống động. Hãy cầm Galaxy S9/S9+ trên tay và tận hưởng ngay những bộ phim yêu thích trên màn hình vô cực rộng lớn cùng âm thanh stereo tuyệt hảo.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/danh_gia_chi_tiet_samsung_galaxy_s9_4.jpg\"></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><b>Sở hữu viên Pin dung lượng lớn:</b><br>\r\n<img alt=\"\" src=\"/Uploads/PostImages/images/danh-gia-pin-galaxy-s9-plus-test.jpg\"></p>\r\n\r\n<p>Hiệu năng cao hơn, màn hình sáng hơn, pin thì không thay đổi và hệ quả là chúng ta có một thiết bị ngốn pin hơn so với S8+ hay Note 8. So với hai thiết bị trên thì pin của S9+ kém hơn một chút, mặc dù có thể sử dụng được cả ngày nhưng rõ ràng là mình không hài lòng về điều này. Ước gì Samsung dám chấp nhận máy dày hơn một chút, và trang bị viên pin 4000mAh thì mình sẽ hạnh phúc hơn.</p>\r\n\r\n<h2>Đôi dòng tâm sự với các bạn đang muốn chuyển từ Apple sang Samsung</h2>\r\n\r\n<p>Khi sử dụng&nbsp;iPhone của Apple và có mong muốn chuyển sang sử dụng sản phẩm của Samsung, bạn sẽ thấy có nhiều tính năng tinh tế hơn đã tồn tại trên smartphone của Samsung hoặc các thiết bị Android khác.</p>\r\n\r\n<p>Sau hơn một tuần sử dụng Galaxy S9+ thay cho iPhone X, một cây viết của tạp chí Time nổi tiếng đã rút ra 5 điều dưới đây khiến anh thích sản phẩm của Samsung hơn so với Apple:</p>\r\n\r\n<p><strong>Always-on display</strong></p>\r\n\r\n<p>Màn hình smartphone của Samsung có thể hiển thị các thông tin như thời gian, ngày, mức pin và các biểu tượng của thông báo ngay cả khi màn hình đã bị tắt. Anh chàng phóng viên này cho biết mình thích cảm giác lướt nhìn màn hình điện thoại xem có gì không nếu có ý định cắm sạc điện thoại trước khi rời văn phòng.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/on-display.jpg\"></p>\r\n\r\n<p><strong>Linh hoạt hơn</strong></p>\r\n\r\n<p>Có 3 tính năng của Galaxy S9+ cho phép người dùng sử dụng điện thoại của mình một cách linh hoạt hơn, bao gồm: bộ cảm biến dấu vân tay, khe cắm thẻ nhớ microSD và giắc tai nghe. Chúng ta sẽ không bị buộc phải gõ mật mã nếu không muốn nhận dạng bằng khuôn mặt và có thể thoải mái sử dụng tai nghe mà không cần phải nhớ mang theo bộ chuyển đổi. Thêm vào đó, người dùng biết rằng mình có thể mở rộng thêm không gian lưu trữ bằng cách mua thẻ nhớ microSD.</p>\r\n\r\n<p><br>\r\n<img alt=\"\" src=\"/Uploads/PostImages/images/linh%20hoat%20hon.jpg\"></p>\r\n\r\n<p>Phóng viên của Time cho biết với iPhone X anh dùng chủ yếu tính năng mở khóa bằng khuôn mặt (Face ID) nhưng đôi khi cũng gõ mật khẩu. Trong tình huống này, anh muốn iPhone X có một cảm biến vân tay ở mặt sau giống như Galaxy S9+ và nhiều điện thoại Android khác. Cảm biến dấu vân tay của Galaxy S9+ nằm ở vị trí tự nhiên hơn so với các phiên bản trước đó - bên dưới máy ảnh chứ không phải cạnh nó – và điều này khiến người dùng dễ thao tác hơn.</p>\r\n\r\n<p>Bởi vì Galaxy S9 có giắc cắm tai nghe 3,5 mm, chàng phóng viên này không phải lo lắng về việc phải mang theo một bộ chuyển đổi cho tai nghe. iPhone X và nhiều điện thoại Android gần đây đã loại bỏ jack cắm tai nghe 3.5mm, nghĩa là bạn phải sử dụng bộ chuyển đổi kèm theo nếu muốn tiếp tục sử dụng tai nghe hiện có của mình. Nếu không, bạn chỉ còn lựa chọn sử dụng tai nghe đi kèm theo thiết bị hoặc chuyển sang tai nghe Bluetooth không dây. Giống như nhiều điện thoại Android khác, bạn cũng có thể gia tăng bộ nhớ của Galaxy S9+ bằng cách mua một thẻ nhớ microSD. Tính năng này có thể hữu ích với những người thích tải xuống nhiều bộ phim dài hoặc thường xuyên quay video 4K trên điện thoại. Bạn có thể mua một thẻ micro SD 128 GB trên Amazon với giá từ 40 đến 45 USD. Trong khi đó, với iPhone, bạn phải chấp nhận dung lượng lưu trữ cố định của nó mà không thể mở rộng bằng thẻ microSD.</p>\r\n\r\n<p><strong>Chụp ảnh trong điều kiện ánh sáng yếu</strong></p>\r\n\r\n<p><br>\r\n<img alt=\"\" src=\"/Uploads/PostImages/images/chup%20anh%20trong%20anh%20sang%20yeu.gif\"></p>\r\n\r\n<p>Camera hàng đầu của iPhone X rất khó bị đánh bại và trong nhiều trường hợp, chàng phóng viên này cho rằng nó tạo những bức ảnh với chi tiết sắc nét hơn và màu sắc chính xác hơn smartphone của Samsung. Nhưng khi nói đến chụp ảnh trong bóng tối, thiết bị của Samsung lại chiếm ưu thế. Gần như tất cả các lần thử nghiệm chụp ảnh trong môi trường này, Galaxy S9+ đều cho ra những bức ảnh chi tiết và rõ ràng hơn. Điều này có thể đạt được nhờ cải tiến của Galaxy S9+ khi cho phép thay đổi giữa 2 tiêu cự f/1.5 hoặc f/2.4 (tùy thuộc vào điều kiện ánh sáng của môi trường).</p>\r\n\r\n<p><strong>Màn hình cong</strong></p>\r\n\r\n<p>Các smartphone mới của Samsung, Apple, Google và LG đều có màn hình hiển thị gần như không có viền. Tuy nhiên, Galaxy S8 và Galaxy Note8 khác biệt đôi chút với màn hình hơi cong ở 2 cạnh bên. Điều này tạo ra vẻ bề ngoài thanh lịch hơn cho thiết bị và thuyết phục người dùng hơn với cảm giác nó không hề có khung viền (Samsung gọi đây là màn hình vô cực).</p>\r\n\r\n<p><br>\r\n<img alt=\"\" src=\"/Uploads/PostImages/images/man%20hinh%20cong.jpg\"></p>\r\n\r\n<p>Thêm vào đó, Galaxy S9+ không có “tai thỏ” ở đỉnh màn hình để bố trí camera và cảm biến nhận dạng khuôn mặt như iPhone X và nhiều thiết bị khác hiện nay.</p>\r\n\r\n<p><strong>Đa nhiệm</strong></p>\r\n\r\n<p>Hầu hết mọi người đều sử dụng điện thoại cho nhiều mục đích khi không làm việc: Tìm chỉ đường, ghi chép, gửi email, duyệt Facebook v.v. Có nghĩa là chúng ta dành nhiều thời gian để chuyển đổi giữa các ứng dụng, đặc biệt là khi bạn cố gắng sao chép và dán tài liệu từ ghi chú vào email.</p>\r\n\r\n<p><br>\r\n<img alt=\"\" src=\"/Uploads/PostImages/images/da%20nhiem.jpg\"></p>\r\n\r\n<p>Chúng ta yêu thích sự đơn giản của iOS nhưng điện thoại Android nhìn chung tốt hơn nhiều khi chạy nhiều ứng dụng cùng một lúc. Smartphone của Samsung từ lâu đã cung cấp khả năng mở nhiều ứng dụng trên màn hình cùng một lúc chứ không riêng gì&nbsp;Galaxy S9+. Chỉ cần chạm vào nút ứng dụng gần đây, nhiều biểu tượng cửa sổ trong thanh tiêu đề được khởi chạy trong chế độ chia màn hình. Apple đã nỗ lực để mang lại sự đa nhiệm tốt hơn cho iPad thông qua các tính năng như Slide Over và Split View trong những năm gần đây nhưng chúng ta vẫn chưa thấy những tính năng này xuất hiện trên iPhone.</p>\r\n\r\n    </div>', 24990000, 21990000, 'product_galaxys9plus_midnightblack_01.png'),
(7, 'iPhone 8 Plus 256GB', '<div class=\"box-article\">\r\n        <div style=\"text-align:center\">\r\n<div>\r\n<p><strong>Bảo hành 1 đổi 1 xử lý trong 24 giờ, <a href=\"https://www.dienthoaididong.com/chinh-sach-bao-hanh-iphone-moi-nhat-cuong.html\" target=\"_blank\">Chi tiết &gt;&gt;</a></strong></p>\r\n\r\n<p style=\"text-align:left\">iPhone 8 &nbsp;là siêu phẩm đang được không chỉ các fan táo khuyết mà cả làng công nghệ mong đợi nhất tại&nbsp;thời điểm này. Từ thiết kế cho tới tính năng của iPhone 8 đều hứa hẹn mang đến cho người dùng những trải nghiệm thú vị chưa từng thấy.</p>\r\n\r\n<h2 style=\"text-align:left\">Đặc điểm nổi bật của iPhone 8 Plus</h2>\r\n\r\n<h3 style=\"text-align:left\">Thiết kế</h3>\r\n\r\n<p style=\"text-align:left\">Về ngoại hình, thiết bị này thoạt nhìn khiến người khác liên tưởng ngay đến người đàn anh nếu không chú ý kĩ đến hai mặt kính trước sau được ốp lên.&nbsp;<strong>iPhone 8 Plus</strong>&nbsp;sở hữu một bộ khung kim loại được hoàn thiện từ chất liệu thép không gỉ được gia cố cứng cáp cùng với 7 lớp xử lý màu cho khả năng chống trầy xước mạnh mẽ, hai mặt trước và sau được bảo vệ bởi một lớp kính bóng loáng bo cong 2.5D thời thượng, chi tiết này đã từng được rò rỉ rất nhiều trước đây, dụng ý của Apple là dùng nó để hỗ trợ cho công nghệ sạc không dây – tính năng lần đầu tiên xuất hiện trên một thiết bị di động của Apple.</p>\r\n\r\n<p style=\"text-align:left\"><img alt=\"\" src=\"/Uploads/PostImages/images/8plus.jpg\"></p>\r\n\r\n<p style=\"text-align:left\">Nhìn chung, iPhone 8 Plus&nbsp;không khác biệt về ngoại hình nhưng lại tạo được cảm giác bóng bẩy sang trọng trong mắt người dùng hơn so với&nbsp;iPhone 7 Plus. Đặc biệt là nhờ vào việc viền ăng – ten đã bị loại bỏ, chi tiết được chê bai rất nhiều khi iPhone 6 lần đầu tiên xuất hiện trên thị trường. Nhiều người tỏ ra khó hiểu vì sao đội ngũ thiết kế của Apple lại có thể để một vệt ang - ten dài loằng ngoằng trên mặt lưng vốn đang đem lại cảm giác vô cùng sang trọng. Với iPhone 8 Plus, việc không còn sự xuất hiện của dải ang - ten đã tạo nên cảm giác liền mạch cho thiết bị.</p>\r\n\r\n<p style=\"text-align:left\"><img alt=\"\" src=\"/Uploads/PostImages/images/8plus1.jpg\"></p>\r\n\r\n<h3 style=\"text-align:left\">Màn hình</h3>\r\n\r\n<p style=\"text-align:left\">Về màn hình, thiết bị sở hữu màn hình LCD truyền thống với công nghệ Retina HD True Tone cho khả năng hiển thị sắc nét, màn hình này đạt kích thước 5.5 inch độ phân giải FullHD 1920 x 1080 được cải tiến mạnh mẽ cho khả năng hiển thị chất lượng cao. Mặt trước vẫn còn sự xuất hiện của viền màn hình khá dày, nhất là hai cạnh trên dưới, chi tiết này từng bị nhiều người dùng thậm chí là người hâm mộ của Apple chê bai vì cho rằng nó dày quá mức cần thiết.</p>\r\n\r\n<p style=\"text-align:left\"><img alt=\"\" src=\"/Uploads/PostImages/images/8plus3.jpg\"></p>\r\n\r\n<p style=\"text-align:left\">Ở cạnh trên là nơi bố trí của loa thoại, cảm biến, camera trước và cạnh dưới là nít Home cảm ứng lực tích hợp với cảm biến vân tay Touch ID để mở khóa và sử dụng như hình thức bảo mật thiết bị và các ứng dụng bên trong.</p>\r\n\r\n<h3 style=\"text-align:left\">Cấu hình và hiệu năng</h3>\r\n\r\n<p style=\"text-align:left\">Cấu hình là chi tiết đáng chú ý nhất của&nbsp;<strong>iPhone 8 Plus</strong>, nếu như ngoại hình không có nhiều sự khác biệt so với thế hệ tiền nhiệm thì cấu hình lại được nâng cấp vô cùng mạnh mẽ, trái tim của iPhone 8 Plus&nbsp;là con chip xử lý Apple A11 Bionic 6 lõi trong đó gồm 2 nhân cho tốc độ cao và 4 nhân xung thấp để tiết kiệm điện năng, chính nhờ vào những chi tiết cấu thành bên trong nó vô cùng mạnh mẽ nên hiệu suất của nó cao hơn Apple A10 đến 70% và tiết kiệm điện năng hơn một nửa.</p>\r\n\r\n<p style=\"text-align:left\"><img alt=\"\" src=\"/Uploads/PostImages/images/8plus5.jpg\"></p>\r\n\r\n<p style=\"text-align:left\">Hỗ trợ cho chip xử lý được hoạt động tối ưu chính là bộ nhớ RAM 3GB kết hợp với bộ nhớ trong lưu trữ dung lượng lớn&nbsp;và hệ điều hành iOS tiên tiến cho khả năng đa nhiệm mượt mà, hứa hẹn đem lại trải nghiệm tuyệt vời cho người dùng trong nhu cầu sử dụng hằng ngày như làm việc và giải trí.</p>\r\n\r\n<p style=\"text-align:left\"><img alt=\"\" src=\"/Uploads/PostImages/images/8plus6.jpg\"></p>\r\n\r\n<p style=\"text-align:left\">Cũng chính nhờ vào hệ điều hành này mà iPhone 8 Plus&nbsp;được nhấn mạnh vào khả năng thực tế ảo AR, cụ thể hơn, nó cho phép người dùng trong nhiều lĩnh vực khác nhau như thiết kế, nhiếp ảnh hoặc mang lại trải nghiệm đỉnh cao khi hóa thân thành một nhân vật trong tựa game nổi tiếng.</p>\r\n\r\n<h3 style=\"text-align:left\">Camera</h3>\r\n\r\n<p style=\"text-align:left\">Một chi tiết không thể không nhắc đến chính là hệ thống camera được trang bị, tất nhiên hệ thống camera kép của&nbsp;<strong>iPhone 8 Plus</strong>&nbsp;vẫn được thiết kế theo chiều ngang, nó cũng được cải tiến mạnh mẽ với những trang bị gồm: hệ thống camera chính với sự kết hợp giữa một ống kính rộng độ phân giải 12MP khẩu độ f/1.8 và một ống kính tele đồng độ phân giải khẩu độ f.2/8 được nâng cấp cho khả năng thu nhận ánh sáng nhiều hơn giúp hình ảnh sắc nét và chi tiết hơn trong mọi điều kiện môi trường.</p>\r\n\r\n<p style=\"text-align:left\"><img alt=\"\" src=\"/Uploads/PostImages/images/8plus2.jpg\"></p>\r\n\r\n<p style=\"text-align:left\">Hơn hết, công nghệ chống rung quang học OIS cũng được tích hợp bên trong nhằm hạn chế tối đa sự rung, nhòe do thao tác chuyển động của tay. Đặc biệt nhất, Apple còn tự thiết kế cho tính năng quay video cho hệ thống này khả năng quay video 4K khung hình 60fps, và nâng tiếp video 240fps lên độ phân giải lên đến 1080p &nbsp;– chỉ số cao nhất từ trước đến nay được tích hợp trên một chiếc smartphone giúp người dùng có thể bắt trọn những khoảnh khắc đáng giá trong cuộc sống nhanh chóng và mượt mà.</p>\r\n\r\n<p style=\"text-align:left\"><img alt=\"\" src=\"/Uploads/PostImages/images/8plus4.jpg\"></p>\r\n\r\n<p style=\"text-align:left\">Giao diện camera của iPhone 8 Plus&nbsp;cũng được thay đổi với một menu mới cho người dùng nhiều sự lựa chọn hiệu ứng ánh sáng hơn phù hợp với ý thích và mục đích mình muốn sử dụng, ngoài ra, nó còn được trang bị bộ lọc màu mới cùng các điểm ảnh có khả năng nhận diện, tái tạo các sải màu sắc tốt hơn đem lại trải nghiệm tuyệt vời cho người dùng. Với hệ thống này, hứa hẹn&nbsp;<strong>iPhone 8 Plus </strong>sẽ&nbsp;đánh bại nhiều đối thủ sừng sỏ trên thị trường hiện nay.</p>\r\n\r\n<p style=\"text-align:left\"><img alt=\"\" src=\"/Uploads/PostImages/images/ip8m1.jpg\"></p>\r\n\r\n<p style=\"text-align:left\">Camera trước độ phân giải 7MP khẩu độ f/2.2 tích hợp tính năng mới Portrait Lighting cho phép người dùng có thể tự tùy chỉnh độ sáng theo thời gian thực theo những mẫu mà Apple đã xây dựng sẵn trong hệ thống để tạo chiều sâu cho bức ảnh của mình.</p>\r\n\r\n<h3 style=\"text-align:left\">Các tính năng khác</h3>\r\n\r\n<p style=\"text-align:left\">Trong khi các thiết bị khác tầm trung lẫn cao cấp khác trên thị trường đã được trang bị công nghệ sạc không dây từ vài năm trước rồi thì Apple đến tận iPhone thế hệ thứ 8 mới có thể trang bị tính năng này. Lý do là vì sạc không dây hoạt động theo nguyên lý truyền điện cảm ứng thông qua các cuộn dây đặt ở đế sạc và trong điện thoại và yêu cầu của nó là không bị chắn bởi chất liệu kim loại. Vậy nên&nbsp;<strong>iPhone 8 Plus</strong>&nbsp;bên cạnh hình thức sạc truyền thống còn sở hữu tính năng sạc không dây thông qua dock sạc gọi là AirPower, khi đặt thiết bị lên tấm nền của dock sạc này, nó sẽ nhanh chóng được kết nối và tiến hành nạp năng lượng cho thiết bị. Ngoài sạc không dây, iPhone 8 Plus&nbsp;cũng có khả năng sạc nhanh khi nạp đầy 50% thời lượng pin của viên pin dung lượng 2900mAh chỉ trong 30 phút.</p>\r\n\r\n<p style=\"text-align:left\"><img alt=\"\" src=\"/Uploads/PostImages/images/apple-091217-iphone-8-3868.jpg\"></p>\r\n\r\n<p style=\"text-align:left\">Bên cạnh đó, iPhone 8 Plus&nbsp;còn sở hữu những trang bị cao cấp khác như: Bluetooth 5.0, kết nối LTE Advanced, chống nước kháng bụi chuẩn IP 68 cho phép chịu nước ở độ sâu 1 mét trong vòng 30 phút.</p>\r\n\r\n<p style=\"text-align:left\"><strong>iPhone 8 Plus</strong>&nbsp;được phân phối với ba tùy chọn màu sắc là Xám, Bạc và Vàng. Tuy nhiên màu Vàng của iPhone 8 Plus&nbsp;không hề giống những phiên bản màu Gold trước đây từng được tung ra, nó mang một nét dịu nhẹ, e ấp đem lại cảm giác thoải mái dễ chịu kể cả khi nhìn quá lâu.</p>\r\n</div>\r\n</div>\r\n\r\n    </div>', 23390000, 21000000, 'iphone 8_1506049947.jpg'),
(8, 'Samsung Galaxy S8 Plus Black Chính hãng\r\n', '<div class=\"box-article\">\r\n        <p style=\"text-align:justify\">Samsung Galaxy S8+ là chiếc điện thoại tạo nên cuộc cách mạng đột phá từ ngoại hình cho đến tính năng. Sức hút từ chiếc điện thoại này đủ lớn để làm xiêu lòng mọi tín đồ công nghệ.</p>\r\n\r\n<h2 style=\"text-align:justify\">Đặc điểm nổi bật của Samsung Galaxy S8+</h2>\r\n\r\n<h3 style=\"text-align:justify\">Đột phá về mặt thiết kế</h3>\r\n\r\n<p style=\"text-align:justify\">Galaxy S8+ là chiếc điện thoại sở hữu ngoại hình khác biệt so với thiết kế thường thấy của những chiếc điện thoại thông thường. Lần đâu tiên trong làng công nghệ xuất hiện chiếc điện thoại với màn hình không viền (hay còn được gọi là màn hình vô cực hoặc màn hình tràn).</p>\r\n\r\n<p style=\"text-align:justify\"><img alt=\"\" src=\"/Uploads/PostImages/images/samsung-galaxy-s8-7.png\"></p>\r\n\r\n<p style=\"text-align:justify\">Thiết kế mới này không chỉ khiến người dùng công nghệ mãn nhãn khi nhìn ngắm mà còn đem đến rất nhiều trải nghiệm thú vị khi sử dụng. Hiển thị hình ảnh trở nên sống động và sắc nét hơn bao giờ hết. Kích thước màn hình tăng lên trong khi kích thước thiết bị di động không đổi giúp cho việc cầm nắm thoải mái, trải nghiệm sự tuyệt vời ngay tầm tay.</p>\r\n\r\n<p style=\"text-align:justify\"><img alt=\"\" src=\"/Uploads/PostImages/images/samsung-galaxy-s8-6.png\"></p>\r\n\r\n<p style=\"text-align:justify\">Lớp vỏ được làm bằng hợp kim nhôm chắc chắn sóng đôi với mặt kính cong, trong suốt chạm đến ngưỡng hoàn hảo về mặt thiết kế.</p>\r\n\r\n<p style=\"text-align:justify\"><img alt=\"\" src=\"/Uploads/PostImages/images/samung-galaxy-s8-3.jpg\"></p>\r\n\r\n<h3 style=\"text-align:justify\">Camera sắc nét</h3>\r\n\r\n<p style=\"text-align:justify\">Galaxy S8+ sở hữu camera trước 8MP và camera sau 12MP được cải tiến ưu việt để lưu lại trọn vẹn mọi khoảnh khắc. Bất kể bạn chụp ảnh vào ban ngày hay ban đêm hoặc trong môi trường thiếu sáng đều sẽ thu được những tấm ảnh với màu sắc chân thực và hình ảnh sắc nét nhất.</p>\r\n\r\n<p style=\"text-align:justify\"><img alt=\"\" src=\"/Uploads/PostImages/images/camera-sau-s8.jpg\"></p>\r\n\r\n<h3 style=\"text-align:justify\">Thỏa thích trải nghiệm các game đỉnh cao</h3>\r\n\r\n<p style=\"text-align:justify\">Với cấu hình gần như&nbsp;khủng nhất trong các dòng smartphone ở thời điểm hiện đại, tích hợp các công nghệ đỉnh cao, S8+ sẽ mang đến cho bạn những trải nghiệm chơi game tuyệt vời.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><img alt=\"\" src=\"/Uploads/PostImages/images/s8-cau-hinh.jpg\"></p>\r\n\r\n<h3 style=\"text-align:justify\">Tính năng bảo mật cao</h3>\r\n\r\n<p style=\"text-align:justify\">Thiết bị này được trang bị công nghệ bảo mật quét mống mắt. Một khi bạn chọn cách khóa điện thoại bằng bảo mật mống mắt, “dế yêu” của bạn sẽ chỉ có thể truy cập được qua chính đôi mắt của bạn. Không chỉ nâng cao mức độ bảo mật, tính năng này còn giúp bạn mở khóa điện thoại nhanh hơn mỗi khi cần.</p>\r\n\r\n<p style=\"text-align:justify\"><img alt=\"\" src=\"/Uploads/PostImages/images/bao-mat-mong-mat-s8.jpg\"></p>\r\n\r\n<h3 style=\"text-align:justify\">Hiệu suất sử dụng pin tăng cường</h3>\r\n\r\n<p style=\"text-align:justify\">Nhờ được trang bị bộ vi xử lý 10nm đầu tiên trên thế giới, Galaxy S8+ hoạt động nhanh và mạnh mẽ hơn trong khi pin được tiết kiệm ở mức tối đa.</p>\r\n\r\n<p style=\"text-align:justify\"><img alt=\"\" src=\"/Uploads/PostImages/images/cong-nge-pin-s8.jpg\"></p>\r\n\r\n<h3 style=\"text-align:justify\">Khả năng kháng bụi, chống nước cao</h3>\r\n\r\n<p style=\"text-align:justify\">Khả năng kháng bụi và nước của Galaxy S8+ đạt chuẩn IP68. Nhờ đó, người dùng có thể thoải mái nghe gọi, sử dụng dưới trời mưa, trong môi trường nước hay ở môi trường bụi bẩn.</p>\r\n\r\n<p style=\"text-align:justify\"><img alt=\"\" src=\"/Uploads/PostImages/images/s8-chong-nuoc.jpg\"></p>\r\n\r\n<h3 style=\"text-align:justify\">Trợ lý ảo Bixby</h3>\r\n\r\n<p style=\"text-align:justify\">Với trợ lý ảo Bixby, bạn có thể ra lệnh cho thiết bị qua cả giọng nói lẫn văn bản. Bixby cũng thay đổi hoàn toàn phương pháp tìm kiếm truyền thống, với Bibxy, bạn chỉ cần bật ứng dụng camera lên và cho trợ lý ảo của mình biết bạn đang muốn gì.</p>\r\n\r\n<p style=\"text-align:justify\"><img alt=\"\" src=\"/Uploads/PostImages/images/tro-ly-ao-s8.jpg\"></p>\r\n\r\n    </div>', 17990000, 16290000, '2_1496027998.jpg'),
(9, 'iPhone 7 Plus - 32GB Black (Likenew)', '<div class=\"box-article\">\r\n        <div style=\"text-align:center\">\r\n<div><strong>Bảo hành 12 tháng 1 đổi 1 xử lý trong 24 giờ, <a href=\"https://www.dienthoaididong.com/chinh-sach-bao-hanh-iphone-moi-nhat-cuong.html\" target=\"_blank\">Chi tiết &gt;&gt;</a></strong></div>\r\n</div>\r\n\r\n<p>iPhone 7 Plus 32GB là sản phẩm chạm đến ngưỡng hoàn hảo cả về thiết kế lẫn tính năng.</p>\r\n\r\n<h3>Thiết kế chạm đến điểm&nbsp;hoàn hảo</h3>\r\n\r\n<p>Mặc dù có nhiều ý cho rằng iPhone 7 Plus không đột phá khi vẫn giữ nguyên thiết kế trong 3 năm nhưng nhìn về bản chất, mẫu thiết kế này đã đạt đến độ hoàn thiện cao và không hề bị lỗi mốt hay lạc hậu so với các thiết kế mới ra.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/iPhone%207%202(2).png\"></p>\r\n\r\n<p>Điều khiến cộng đồng công nghệ xôn xao nhất là Apple đã quay lại với jack cắm tai nghe 3.5mm với cam kết rằng điều này sẽ đem lại trải nghiệm âm nhạc đột phá cho người sử dụng.</p>\r\n\r\n<h3>Nút home cảm ứng hoàn toàn mới</h3>\r\n\r\n<p>Từ thế hệ 7, Apple đã xóa sổ hoàn toàn nút bấm vật lý trên màn hình iPhone. Giờ đây, nút home đã trở thành cảm ứng, bạn chỉ cần chạm nhẹ để máy biết bạn đã tương tác. Điều này sẽ loại bỏ nỗi lo hỏng phím home từ trước đến nay của người dùng.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/nut%20home%20cam%20ung%20iphone%207%20lus.jpg\"></p>\r\n\r\n<h3>Camera kép như máy ảnh chuyên nghiệp</h3>\r\n\r\n<p>iPhone 7 Plus được trang bị 2 camera kép với độ phân giải đồng thời 12MP, trong đó một ống kính có khẩu độ lên đến f/1.8 và một ống kính zoom lên đến 10x. Camera có tính năng ổn định hình ảnh quang học tự động, với tính năng này, bạn sẽ có những bức hình được hạn chế rung tối đa.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/iPhone%207%206(2).jpg\"></p>\r\n\r\n<h3>Tính năng chống nước tiện lợi</h3>\r\n\r\n<p>Tuy không phải là chiếc điện thoại đầu tiên có khả năng chống nước nhưng iPhone 7 Plus lại là một trong những chiếc điện thoại làm tốt nhất điều ấy. Fan táo có thể yên tâm bỏ đi nỗi lo iPhone hỏng khi rơi xuống nước vì giờ đây, iPhone 7 có thể sống ở độ sâu 1m trong 30 phút.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/iphone%207%20plus%20chong%20nuoc.jpg\"></p>\r\n\r\n<h3>Hiệu năng vượt trội</h3>\r\n\r\n<p>iPhone 7 Plus 32GB sở hữu chip A10 Fusion 4 lõi, 64-bit có hiệu năng xử lý cao hơn 40% so với chip A9 của iPhone 6/6s. Điểm đặc là Apple đã bỏ đi phiên bản 16Gb và thêm vào phiên bản 32GB để người dùng có thể thoải mái lưu trữ dữ liệu mà không lo bộ nhớ bị đầy.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/iphone-7-plus-hieu-nang-vuot-troi.jpg\"></p>\r\n\r\n<p>Như vậy, dù có nhiều luồng ý kiến trái chiều nhưng Apple vẫn giữ vững phong độ khi đưa iPhone 7 Plus trở thành chiếc điện thoại được cộng đồng mong ước nhất trong thời điểm hiện tại.</p>\r\n\r\n    </div>', 15190000, 0, '3.jpg');
INSERT INTO `product` (`id`, `name`, `description`, `unit_price`, `promotion_price`, `thumbnail`) VALUES
(10, 'Chuột Mac Magic Mouse 2', '<div class=\"box-article\">\r\n            <p>Chuột Mac Magic Mouse 2 là phiên bản nâng cấp của chuột Mac Magic Mouse. So với sản phẩm tiền nhiệm, phiên bản&nbsp;này có ngoại hình tương tự nhưng sở hữu nhiều cải tiến&nbsp;hơn về mặt công nghệ để trở nên&nbsp;thân thiện hơn với người dùng.</p>\r\n\r\n<h2>Đặc điểm nổi bật của chuột Mac Magic Mouse 2</h2>\r\n\r\n<p>Magic Mouse 2 hút mắt người dùng ngay từ cái nhìn&nbsp;đầu tiên bằng màu trắng sang trọng và tinh khôi.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/Apple-Magic-Mouse-2-1.jpg\"></p>\r\n\r\n<p>Thoạt nhìn, người dùng dễ nhầm lẫn Magic Mouse 2 với phiên bản trước đó. Tuy nhiên, khi cầm sản phẩm trên tay, bạn sẽ dễ dàng nhận ra điểm khác biệt.&nbsp;Magic Mouse 2 nhẹ hơn hẳn so với Magic Mouse, cho phép người dùng thao tác với chuột dễ dàng&nbsp;và mượt mà hơn.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/CHUOT-KHONG-DAY-MAGIC-MOUSE-21.jpg\"></p>\r\n\r\n<p>Mặt nhựa trơn bóng của thiết bị được tích hợp tính năng cảm ứng đa điểm toàn phần và chỉ có duy nhất một phím bấm. Nhờ vậy, bạn sẽ&nbsp;dễ dàng thao tác trên thiết bị bằng cử chỉ tay tương tự như khi thao tác trên iPhone, iPad và&nbsp;iPod Touch.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/Apple%20Magic%20Mouse%202-5.jpg\"></p>\r\n\r\n<p>Bề mặt rê bên dưới chuột Mac Magic Mouse 2 được tích hợp cảm biến laze nhạy hơn nhiều so với cảm biến quang học truyền thống giúp thao tác chính xác hơn&nbsp;mà không cần dùng đến tấm lót.</p>\r\n\r\n<p><img alt=\"\" src=\"/Uploads/PostImages/images/Apple-Magic-Mouse-2-2.jpg\"></p>\r\n\r\n<p>Khác với phiên bản trước, viên pin AA đã được loại bỏ hoàn toàn khỏi Magic Mouse 2. Thay vào đó, Apple trang bị cho phụ kiện này cổng lighting để nạp năng lượng. Đặc biệt hơn, chỉ cần cắm sạc trong 2 phút, chuột của bạn có đủ năng lượng để dùng liên tục trong 9 giờ.</p>\r\n\r\n<p>Và nếu chuột được sạc đầy pin, bạn có thể dùng nó trong vòng 1 tháng. Cải tiến này giúp người dùng tiết kiệm được một khoản không nhỏ chi phí cho việc&nbsp;thay pin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n        </div>', 2250000, 0, 'CHUOT-KHONG-DAY-MAGIC-MOUSE-2_1500261710.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

CREATE TABLE `product_attribute` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_value_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `product_id`, `category_id`) VALUES
(1, 10, 1),
(2, 2, 1),
(3, 9, 1),
(4, 7, 1),
(5, 1, 1),
(6, 4, 1),
(7, 6, 2),
(8, 8, 2),
(9, 3, 2),
(10, 3, 4),
(11, 6, 4),
(12, 7, 4),
(13, 8, 4),
(14, 1, 3),
(15, 3, 3),
(16, 10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`id`, `product_id`, `image`) VALUES
(1, 1, 'iphone-x-1.jpg'),
(2, 1, 'apple-091217-iphone-x-4125=.jpg'),
(3, 2, 'ipad-pro-9-7-35.jpg'),
(4, 2, 'Apple iPad Air 2.jpg'),
(5, 1, 'apple-091217-iphone-x4001_1170x780-800-resize.jpg'),
(6, 2, 'iPad-2017.png'),
(7, 3, 'camera.PNG'),
(8, 3, 'note8 thiet ke tien.PNG'),
(9, 3, 'cau hinh note8.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_order`
--

CREATE TABLE `product_order` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `atributes` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_order`
--

INSERT INTO `product_order` (`id`, `product_id`, `order_id`, `price`, `quantity`, `atributes`, `note`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 2, 2, NULL, NULL, '2018-04-29 06:59:37', '2018-04-29 06:59:37'),
(2, 3, 4, 4, 4, NULL, NULL, '2018-04-29 07:25:29', '2018-04-29 07:25:29'),
(3, 1, 4, 2, 2, NULL, NULL, '2018-04-29 07:25:29', '2018-04-29 07:25:29'),
(4, 2, 4, 2, 2, NULL, NULL, '2018-04-29 07:25:29', '2018-04-29 07:25:29'),
(5, 1, 6, 1, 1, NULL, NULL, '2018-04-29 23:52:15', '2018-04-29 23:52:15'),
(6, 2, 6, 1, 1, NULL, NULL, '2018-04-29 23:52:15', '2018-04-29 23:52:15'),
(7, 3, 6, 1, 1, NULL, NULL, '2018-04-29 23:52:15', '2018-04-29 23:52:15'),
(8, 6, 6, 1, 1, NULL, NULL, '2018-04-29 23:52:15', '2018-04-29 23:52:15'),
(9, 5, 6, 1, 1, NULL, NULL, '2018-04-29 23:52:15', '2018-04-29 23:52:15'),
(10, 4, 6, 1, 1, NULL, NULL, '2018-04-29 23:52:15', '2018-04-29 23:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `content` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `user_id`, `product_id`, `rating`, `content`, `created_at`, `updated_at`) VALUES
(2, 1, 3, 1, 'Test 2', '2018-04-29 23:14:42', '2018-05-04 00:56:28'),
(3, 2, 3, 5, 'Test', '2018-04-30 00:16:16', '2018-04-30 00:16:16'),
(5, 2, 2, 4, 'test', '2018-04-30 01:05:47', '2018-04-30 01:05:47'),
(6, 2, 6, 5, 'Nice được đấy', '2018-04-30 01:16:07', '2018-04-30 01:16:07'),
(7, 1, 2, 1, 'Test 5', '2018-04-30 01:18:31', '2018-04-30 01:29:56'),
(8, 2, 1, 1, 'Test', '2018-05-05 08:13:36', '2018-05-05 08:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_info`
--

CREATE TABLE `shipping_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shipping_info`
--

INSERT INTO `shipping_info` (`id`, `user_id`, `name`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(10, 1, 'Phúc', 'Hà Nội', '123456', 'phuc@gmail.com', '2018-04-29 04:46:09', '2018-04-29 04:46:09'),
(11, 1, 'Phúc', 'Hà Nội', '123456', 'phuc@gmail.com', '2018-04-29 04:46:59', '2018-04-29 04:46:59'),
(12, 1, 'Phúc', 'Hà Nội', '123456', 'phuc@gmail.com', '2018-04-29 04:47:15', '2018-04-29 04:47:15'),
(13, 1, 'Phúc', 'Hà Nội', '123456', 'phuc@gmail.com', '2018-04-29 04:50:09', '2018-04-29 04:50:09'),
(14, 1, 'Phúc', 'hà Nội', '125423', 'email@example.com', '2018-04-29 06:57:57', '2018-04-29 06:57:57'),
(15, 1, 'Phúc', 'hà Nội', '125423', 'email@example.com', '2018-04-29 06:59:37', '2018-04-29 06:59:37'),
(16, 1, 'Phúc', 'Ionia', '131231231', 'example@example.com', '2018-04-29 07:25:29', '2018-04-29 07:25:29'),
(17, 1, 'Phúc', 'Ionia', '131231231', 'example@example.com', '2018-04-29 07:25:54', '2018-04-29 07:25:54'),
(18, 2, 'Puddin', 'Demacia', '131231232', 'puddin@trueplus.vn', '2018-04-29 23:52:15', '2018-04-29 23:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shoppingcart`
--

INSERT INTO `shoppingcart` (`identifier`, `instance`, `content`, `created_at`, `updated_at`) VALUES
('phucdoit@gmail.com', 'default', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:2:{s:32:\"cd32de5c1dd5100646c6a7cf88a8e573\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"cd32de5c1dd5100646c6a7cf88a8e573\";s:2:\"id\";s:1:\"3\";s:3:\"qty\";i:2;s:4:\"name\";s:44:\"Samsung Galaxy Note8 Tím Khói Chính Hãng\";s:5:\"price\";d:19990000;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:1:{s:9:\"thumbnail\";s:18:\"note8 tim khoi.jpg\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";N;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:10;}s:32:\"4e4deabe5fa5060febdd69101e4eff06\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"4e4deabe5fa5060febdd69101e4eff06\";s:2:\"id\";s:1:\"1\";s:3:\"qty\";i:1;s:4:\"name\";s:12:\"iPhone X 64G\";s:5:\"price\";d:24890000;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:1:{s:9:\"thumbnail\";s:31:\"iphone-x-silver-select-2017.jpg\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";N;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:10;}}}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `attributes` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Phúc Đỗ', 'phucdoit@gmail.com', '$2y$10$TtYuI5Sp3JzXviizMcmgQ.Kgsq0lIS/.epSZGTBcvzkLsxiozvxzi', 'h0NcofJbGKhIAN0bcbug91TrXavYVD03fnOKol3CA0qZ1nXJOBrVR8v66LuH', '2018-04-24 00:55:19', '2018-04-24 00:55:19'),
(2, 'Puddin', 'puddin@trueplus.vn', '$2y$10$q4G.Fc6ygXbv3jhlM1FIJ.89oeJvKUihpHpZnlStHGrUg7ICKExXu', 'YivB2iz9AQ2fi6D0C13XNqpvpo2srhYbcbePVabSXDyMxIWgfDP3tYrXqSbN', '2018-04-29 23:50:30', '2018-04-29 23:50:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_admin_user_admin_role1_idx` (`admin_role_id`);

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_attribute_value_attribute1_idx` (`attribute_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cart_customer1_idx` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comment_product1_idx` (`product_id`),
  ADD KEY `fk_comment_customer1_idx` (`customer_id`);

--
-- Indexes for table `comment_detail`
--
ALTER TABLE `comment_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comment_detail_comment1_idx` (`comment_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_invoice_order1_idx` (`order_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_customer1_idx` (`user_id`),
  ADD KEY `fk_order_shipping_address1_idx` (`shipping_info_id`),
  ADD KEY `fk_order_payment1_idx` (`payment_id`),
  ADD KEY `fk_order_discount1_idx` (`discount_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_has_attribute_value_attribute_value1_idx` (`attribute_value_id`),
  ADD KEY `fk_product_has_attribute_value_product1_idx` (`product_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_has_category_category1_idx` (`category_id`),
  ADD KEY `fk_product_has_category_product_idx` (`product_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_image_product1_idx` (`product_id`);

--
-- Indexes for table `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_has_order_order1_idx` (`order_id`),
  ADD KEY `fk_product_has_order_product1_idx` (`product_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_has_customer_customer1_idx` (`user_id`),
  ADD KEY `fk_rating_product1_idx` (`product_id`);

--
-- Indexes for table `shipping_info`
--
ALTER TABLE `shipping_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_shipping_address_customer1_idx` (`user_id`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_has_cart_cart1_idx` (`cart_id`),
  ADD KEY `fk_product_has_cart_product1_idx` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_role`
--
ALTER TABLE `admin_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_value`
--
ALTER TABLE `attribute_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment_detail`
--
ALTER TABLE `comment_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_attribute`
--
ALTER TABLE `product_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shipping_info`
--
ALTER TABLE `shipping_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD CONSTRAINT `fk_admin_user_admin_role1` FOREIGN KEY (`admin_role_id`) REFERENCES `admin_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD CONSTRAINT `fk_attribute_value_attribute1` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_customer1` FOREIGN KEY (`user_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comment_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comment_detail`
--
ALTER TABLE `comment_detail`
  ADD CONSTRAINT `fk_comment_detail_comment1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `fk_invoice_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_discount1` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_payment1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_shipping_address1` FOREIGN KEY (`shipping_info_id`) REFERENCES `shipping_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD CONSTRAINT `fk_product_has_attribute_value_attribute_value1` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_value` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_has_attribute_value_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `fk_product_has_category_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_has_category_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `fk_product_image_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product_order`
--
ALTER TABLE `product_order`
  ADD CONSTRAINT `fk_product_has_order_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_has_order_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `fk_rating_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `fk_product_has_cart_cart1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_has_cart_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
