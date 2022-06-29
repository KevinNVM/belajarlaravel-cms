-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2022 at 05:21 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belajarlaravel_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Web Programming', 'web-programming', '2022-06-28 01:18:32', '2022-06-28 01:18:32'),
(2, 'Design', 'design', '2022-06-28 01:18:32', '2022-06-28 01:18:32'),
(3, 'Lifestyle', 'lifestyle', '2022-06-28 01:18:32', '2022-06-28 01:18:32');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_26_051418_create_posts_table', 1),
(6, '2022_06_26_073932_create_categories_table', 1),
(7, '2022_06_28_150147_add_is_admin_to_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `title`, `slug`, `image`, `excerpt`, `body`, `publish_at`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 'Ut ratione dolores quia expedita ut adipisci excepturi dolor molestiae.', 'quis-et-incidunt-repellat-aut', NULL, 'Fugit debitis aut repellat voluptatum nostrum. Ex autem soluta cupiditate quisquam sit. Autem quis veritatis similique voluptatem. Soluta sunt fugit sed.', '<p>Sint nostrum iste nisi. Qui eaque dolores voluptatem aliquam.</p><p>Et excepturi recusandae laborum doloribus. Enim aut est et quasi. Nam expedita ad numquam dolorum.</p><p>Sit nesciunt non dolores ipsam. Consectetur porro dolores asperiores quo veritatis. Autem libero quas dolorem.</p><p>Qui asperiores omnis perspiciatis nobis labore iusto ex. Ratione eaque vero praesentium suscipit quia libero possimus. Quam et aut nesciunt earum nesciunt.</p><p>Sit quas amet nihil. Incidunt molestiae velit modi nesciunt. Sed qui rerum eum sequi.</p><p>Ut velit magni et qui tempora odio et. Vero itaque nihil veniam. Non quis distinctio est cupiditate et similique. Corrupti consectetur molestias optio numquam eum voluptatem.</p><p>Consequatur quidem culpa optio molestias ea. Vel consequatur id distinctio autem consequatur totam. Harum id atque omnis culpa ut asperiores.</p><p>Qui temporibus dolores libero quasi modi. Consequatur at sunt dolorem. Et dolorem necessitatibus ea sed qui quo.</p><p>Autem mollitia et aliquid odit et. Sunt est aliquid officia deleniti odio itaque officia soluta. At blanditiis voluptate voluptate similique voluptas minus. Fugiat aut enim iure magni.</p><p>Placeat molestiae sapiente dicta. Voluptate voluptatem repellendus delectus. Rerum qui enim ab omnis et. Qui eius consequatur et repellendus.</p>', NULL, '2022-06-28 01:18:32', '2022-06-28 01:18:32'),
(3, 1, 2, 'Accusamus atque rem.', 'provident-magni-labore-neque-nisi', NULL, 'Sed non rem earum quod aut. Natus aperiam voluptas excepturi provident et suscipit. Nulla est aut explicabo velit. Ut dolorum labore et libero.', '<p>Voluptas ab eos nemo molestiae. Est omnis autem ea. A id porro ut accusamus dignissimos debitis voluptas. Vitae voluptatum qui minima sed hic reprehenderit quia tempora.</p><p>Ratione soluta quae distinctio alias alias. Neque recusandae perspiciatis qui. At et eligendi dolorem doloribus architecto quisquam eaque. Harum rerum qui aut perferendis laborum vitae dicta quia.</p><p>Corporis alias et autem sapiente at consequatur aut. Et a est tempora quisquam. Ratione ullam cum reprehenderit quia dignissimos soluta. Ipsam beatae voluptatem commodi.</p><p>Exercitationem voluptatibus itaque soluta et vitae iure eius quo. Autem at enim deleniti architecto eveniet quisquam reiciendis saepe.</p><p>Minus et reprehenderit eum ut repudiandae in sunt et. Libero quae voluptatem consectetur totam aut ut voluptas. Soluta voluptate autem consequatur et aut voluptatem eius at.</p><p>Ut voluptatibus vero ratione consequatur qui nihil ut. Et sapiente facere impedit soluta minus. Eum vel dolorum sint voluptas nesciunt eaque quo natus.</p><p>Esse repudiandae mollitia similique sed praesentium quam voluptas. Laudantium quos et numquam rerum explicabo numquam sint. Dignissimos esse nulla ut illo ex consequatur.</p><p>Maiores quia expedita ducimus quia. Quo eligendi et sapiente amet quaerat. Ipsum temporibus voluptas possimus similique inventore sit qui.</p><p>Et quis earum suscipit nisi dolore pariatur. Dolorem qui et ea nobis voluptatibus. Alias autem sit ut tempore quis molestias vitae.</p>', NULL, '2022-06-28 01:18:32', '2022-06-28 01:18:32'),
(6, 1, 3, 'Iure quo eum sapiente autem sit ipsum cum quam quas quam.', 'id-rerum-modi-voluptates-autem-sed-dolor', NULL, 'Temporibus totam ab ducimus dolorem. Molestiae eos et expedita. Maiores qui ipsa velit quisquam aut voluptas quibusdam.', '<p>Iure velit quidem et ut aut delectus temporibus. Et reprehenderit explicabo dolorem veritatis quos. Accusantium quod est sit sunt. Distinctio ipsum commodi voluptatum odio fuga est.</p><p>Qui hic nemo quaerat consectetur quia sapiente consectetur. Placeat numquam id tenetur debitis nam et amet. Error vitae labore illum perferendis aperiam tenetur qui. Nostrum iusto libero pariatur est recusandae soluta est.</p><p>Qui recusandae est sequi sunt dicta libero harum. Non enim incidunt autem error quis sint consequuntur. Qui quam repellendus non accusantium sed blanditiis. Dolor in dolorem neque iusto animi.</p><p>Ex rerum est voluptatum tempore. Dolore doloremque quo perspiciatis sint doloribus est. Repellendus dolore ratione omnis nesciunt dolor sit aut.</p><p>Ut repellendus voluptatem maxime at molestiae. Qui perspiciatis voluptas aliquid ipsa sed. Impedit accusantium et quaerat. Natus culpa aut quisquam sit.</p><p>Inventore velit ratione et minima. Cum facilis in temporibus natus asperiores nemo. Quos mollitia id a et molestias accusantium enim non.</p><p>Saepe dolore error laudantium deleniti et enim dolorem quia. Dolore esse corrupti quo beatae atque omnis tempore. Optio consequuntur nihil perspiciatis voluptates quaerat sunt.</p><p>Mollitia et minus sunt in explicabo. Autem natus aut non sint fugiat praesentium voluptatibus consequatur. Quia aut quidem commodi dicta aperiam voluptates. Illum veritatis rerum possimus quo sed pariatur aut.</p><p>Est sit nulla est natus earum fugiat. Architecto reprehenderit sint et iure voluptas impedit magnam laborum. Perspiciatis sed laborum architecto placeat nisi id.</p><p>Dolorem voluptatem et illo ut sint omnis. Qui earum id et id. Error eos molestias quas architecto fugiat dignissimos delectus.</p><p>Excepturi et et cum at sed qui quos. Blanditiis explicabo aliquam quis tempore aut exercitationem necessitatibus.</p>', NULL, '2022-06-28 01:18:32', '2022-06-28 01:18:32'),
(7, 2, 3, 'Expedita qui autem odit non et.', 'at-quia-perspiciatis-id-ipsam-quod', NULL, 'Pariatur sint voluptates asperiores doloremque quod doloremque. Nulla tenetur dicta molestiae quasi voluptatibus sit occaecati. Sequi voluptate aut quia blanditiis ipsa libero et.', '<p>Cupiditate corporis dolor minus sint. Ipsam ut omnis est vero enim eveniet optio. Consectetur velit debitis eius sunt sed voluptas.</p><p>Qui aut ab facilis qui enim quo sequi. Assumenda voluptate similique quia quam numquam necessitatibus vel quo.</p><p>Possimus aperiam harum quae sequi non consequatur aut. Nisi similique ut sed dolor dolorem quia. Dolores consequatur itaque quas. Harum quia vitae corporis ipsam molestiae.</p><p>Eum id dolores nulla nemo occaecati magni error. Laboriosam corporis error harum accusamus qui quas id. Quidem provident ea nulla laborum ut distinctio est. Aut quis molestiae est amet veritatis ullam repellendus.</p><p>Quod consequatur quisquam ipsam rerum. Recusandae reprehenderit aspernatur est sed omnis. Nulla assumenda id architecto dignissimos.</p><p>Ea sed doloribus aperiam voluptatum repellendus ab corporis distinctio. Quam sit sunt odio recusandae voluptas dolorem sit. Cumque fuga sequi quaerat aut doloremque laudantium sit et. Nam ipsum similique accusantium repudiandae.</p>', NULL, '2022-06-28 01:18:32', '2022-06-28 01:18:32'),
(8, 1, 2, 'Illo rerum temporibus deserunt cum est nisi sed officiis.', 'nisi-incidunt-voluptatibus-ipsam-quibusdam-qui', NULL, 'Facere explicabo iusto enim provident nesciunt at quae. In et voluptas fugiat aut molestiae.', '<p>Vero eum illo quis aut. Quia laudantium delectus consequuntur voluptas iusto error. Id velit odit distinctio sed rerum accusantium. Autem impedit non eligendi deleniti vero occaecati.</p><p>Ab et dolore commodi fugit autem necessitatibus sint. Rerum quidem et a. Qui sed velit vitae aut repudiandae nesciunt. Ut quos amet magni dignissimos esse libero.</p><p>Neque ab sapiente ipsa perspiciatis vel maiores quidem. Qui ut error molestiae.</p><p>Quo est at sit fugit maxime mollitia. Beatae error sunt praesentium quaerat iusto asperiores. Atque omnis dolores voluptas cum ea perferendis necessitatibus. Dolores sapiente possimus sit magni ut dolor.</p><p>Impedit recusandae ad sit at non. Omnis nesciunt velit quia et optio est. Deserunt fuga fugit aut blanditiis unde provident. Harum ipsa placeat minima rerum hic exercitationem sed.</p><p>Iusto facere et ut perspiciatis. Delectus corporis dolor omnis reprehenderit. Suscipit aut et sint laudantium. Repellendus omnis ipsam iure. Quidem quo nihil labore mollitia vero voluptas.</p><p>Voluptatum numquam rem incidunt saepe ipsum temporibus. Ducimus libero blanditiis consequatur nesciunt ipsam vitae error. Sit ullam autem rem eveniet.</p><p>Error iure ad nobis repellat. Magni veritatis ducimus delectus id eius magnam qui est. Est nihil omnis sed eius.</p>', NULL, '2022-06-28 01:18:32', '2022-06-28 01:18:32'),
(10, 1, 3, 'Sunt delectus quis adipisci consectetur ratione magni repudiandae voluptate libero.', 'rerum-voluptatem-fugit-perspiciatis-tenetur-voluptates-vel-sit', NULL, 'Qui aliquid sunt fugit temporibus nemo quam. Voluptatem delectus voluptatem blanditiis libero voluptate commodi explicabo. Saepe et reiciendis magnam.', '<p>Impedit reprehenderit quia quos rerum alias. Sunt ipsa sit ipsum aut et et. Molestiae molestiae dolores totam vitae.</p><p>Sed qui cumque reprehenderit quaerat cumque delectus exercitationem dolores. Quis necessitatibus est sint quo qui beatae. Velit molestiae odit officiis consequatur. Quaerat nihil at cupiditate et ut.</p><p>Fugiat sint exercitationem qui et ut. Perspiciatis illum sint deserunt. Voluptatem eius eos itaque molestias. Maxime magnam sint sunt ducimus eaque totam. Suscipit quasi sit nisi minima quisquam enim sint hic.</p><p>Minima repellendus aspernatur soluta amet sed cumque. Magni veritatis commodi beatae est harum laboriosam sed sit. Et architecto qui harum voluptas sunt provident cumque. Aliquid reprehenderit eum tenetur dolor atque aut.</p><p>Inventore accusamus quod rerum maxime. Fugit molestiae et consequatur esse omnis qui cum. Enim et ullam quos atque quibusdam. Adipisci itaque illum quasi molestiae nostrum voluptatem harum sapiente.</p><p>Perferendis sapiente nemo sed veritatis rerum. Natus quos quas facere quasi est. Eius voluptate voluptas minima illum saepe.</p>', NULL, '2022-06-28 01:18:32', '2022-06-28 01:18:32'),
(11, 1, 2, 'Reprehenderit aut minus in eum distinctio nihil nisi vero temporibus ipsam.', 'natus-ducimus-necessitatibus-qui-quibusdam', NULL, 'Sed qui cum perspiciatis et ipsa animi. Quis et cum facere et reiciendis quibusdam temporibus corrupti. Nihil quam ea est qui quod.', '<p>Repellendus autem corrupti delectus sint vero maxime distinctio. Ad est ipsum rem molestiae ducimus fugiat. Et ipsum sit non architecto reiciendis placeat.</p><p>Excepturi et mollitia voluptatem optio sapiente voluptas rem. Commodi omnis voluptatem magnam quos consequatur et. Aliquid rerum nostrum id quia dignissimos eveniet itaque. Nesciunt velit molestiae est nemo et.</p><p>Voluptatibus quaerat explicabo consequuntur cum iste ipsa qui delectus. Amet ratione reprehenderit placeat illo rerum quo qui. Et similique recusandae non explicabo non vel.</p><p>Officiis quia magnam quo alias sint voluptates. Magnam necessitatibus vel temporibus non deserunt excepturi ea tenetur. Aperiam impedit reiciendis totam id excepturi soluta. Ipsam enim adipisci veniam similique.</p><p>Reiciendis nemo quas odit numquam praesentium. Labore voluptatibus nihil quod vero aut eveniet odit.</p><p>Sed in quia sit. In nisi voluptatum et et reprehenderit cum ipsum. Et voluptatibus qui possimus vitae error sequi non. Nihil sit molestiae in doloribus itaque impedit quos.</p><p>Quo laborum aut consectetur molestiae laboriosam voluptatem. Fugit sit sed ab animi quia quibusdam. Quia aut pariatur ex hic quisquam ullam.</p><p>Quam maiores qui sapiente. Occaecati reiciendis voluptatem provident beatae incidunt in maiores.</p><p>Dignissimos eos sed reprehenderit commodi. Vero eos deserunt quibusdam quo voluptatem sit quo. Omnis nisi quae voluptates ad sint.</p><p>Asperiores repellendus nobis eius nam assumenda. Et quisquam veniam sit iusto. Dicta sapiente cum omnis tempore neque eos deserunt. Nihil rerum aliquam vitae nobis.</p>', NULL, '2022-06-28 01:18:32', '2022-06-28 01:18:32'),
(12, 1, 3, 'Quisquam illo earum est nulla consequuntur.', 'unde-quia-quia-quia-eum-architecto-ab', NULL, 'Doloremque qui distinctio ducimus incidunt. Laudantium nostrum delectus dolorem est laborum provident repellendus. Dolorem porro quia in. Vero eum necessitatibus minima nam nulla.', '<p>Provident sunt quidem eaque non. Voluptatibus ipsa enim eum nesciunt est dignissimos libero. Corporis reprehenderit fugiat occaecati dolores. Qui ratione amet aut praesentium aut.</p><p>Omnis quia reiciendis neque corporis dolor sint et minus. Eligendi quaerat eos ab voluptatibus. Tenetur aliquam nihil placeat a ipsam perferendis.</p><p>Quia aperiam modi debitis omnis dolor animi. Ut unde iure dolores consectetur explicabo vero omnis. Molestiae molestiae inventore vero est corporis. Quis nam amet sed aut corrupti in eius.</p><p>Sit et asperiores quo incidunt molestiae odit. Sed harum officiis ut repellendus quaerat quia distinctio sint. Unde et adipisci consectetur in.</p><p>Earum inventore tempora quod dolores maiores. Mollitia sit cumque nulla quae et maiores asperiores.</p><p>Esse et aut commodi. Adipisci quas praesentium quis nulla. Dignissimos et modi dolorem error eos quae.</p>', NULL, '2022-06-28 01:18:32', '2022-06-28 01:18:32'),
(13, 1, 2, 'Magnam quia voluptatem soluta.', 'quisquam-harum-odio-iure-sit-ea-iste', NULL, 'Aut quas ad quos a nihil nemo dolorum aspernatur. Sit omnis aut accusamus expedita velit aut. Enim rem quisquam aut voluptatem id voluptate. Ut perspiciatis quas ut totam velit consequatur.', '<p>Magni voluptatem dolor saepe qui aut. Nisi quaerat illum voluptate ea eum impedit. Unde rem dolorem voluptates eius id.</p><p>Dignissimos est saepe sint eum. Consectetur pariatur qui dolorem doloremque cupiditate praesentium. Molestias repellat et molestiae maiores vero aperiam.</p><p>Illo vel hic iusto ipsam et numquam. Doloremque consequuntur soluta reiciendis totam repellendus. Fugiat sit dolor enim rem. Nemo asperiores distinctio sit occaecati.</p><p>Eos esse porro ut in aliquid. Ex ut rerum autem distinctio dolore dolores. Qui culpa qui fugit dolor modi eos. Quis sed est velit ipsum animi saepe. Esse corrupti ex nemo sunt soluta voluptatibus quasi.</p><p>Aut est quia autem ut corrupti voluptas. Itaque quas corrupti et numquam. Et voluptatum provident nesciunt sunt. Quia amet voluptas vel veniam optio atque.</p><p>Laborum et eos dolor eaque. Laborum porro aperiam deserunt enim laboriosam. Provident aut necessitatibus molestiae mollitia non. Et accusamus quasi enim.</p><p>Neque porro dolorem vel molestias qui unde eos. Nihil qui laboriosam accusantium. Quia qui est voluptatum.</p>', NULL, '2022-06-28 01:18:32', '2022-06-28 01:18:32'),
(15, 2, 3, 'Enim et minus hic maxime et ea nobis est eveniet minus odit nemo.', 'temporibus-animi-sint-hic-atque', NULL, 'Sed architecto nesciunt excepturi et. Nam exercitationem omnis rerum mollitia. Inventore explicabo id ad laborum.', '<p>Non et velit dolor dolorem quam maxime. Sit autem error quia ex in. Est mollitia eos sint architecto velit magni debitis.</p><p>Fugiat iste totam in. Reiciendis numquam voluptatem ea quidem. Quaerat fuga officiis sed sint.</p><p>Quis quia beatae a deserunt et itaque vero. Autem est omnis voluptas eos. Quibusdam consequuntur cupiditate consequuntur autem perspiciatis. Odio quam necessitatibus aut qui.</p><p>Quidem omnis accusantium dolores et nam aperiam sit. Dignissimos tempora numquam aut asperiores qui reprehenderit vel dolores. Exercitationem assumenda voluptatum ut corporis id. Similique fugiat sint voluptatibus dolore.</p><p>Quibusdam quam alias occaecati commodi minima. Quia cum nihil qui aspernatur illum eligendi. Et corrupti quidem dolorem aspernatur vitae. Molestias possimus impedit cupiditate odit porro molestias sint quo.</p><p>Quam quis beatae qui dolores nihil. Et soluta ut nihil dolorum nesciunt natus voluptas. Animi fugit vero nostrum dolores unde. Iure esse nostrum consequatur.</p><p>Rerum qui aperiam rem provident similique. Voluptate quas amet qui et corrupti blanditiis. Dolorem deleniti id unde quod est sed quia. Eum inventore explicabo eum odit ipsum est nesciunt est.</p><p>Autem ipsam quia id eos. Similique dolorem reiciendis blanditiis ipsum nam qui dolore. Sed maxime amet assumenda odio doloribus minima. Est eos animi ut vel debitis perspiciatis.</p><p>Minus esse dolorem ut corrupti rerum. Beatae voluptatem fugiat sed omnis. Soluta ipsam id esse consequatur dignissimos accusantium est. Qui quo illum accusamus accusantium debitis.</p><p>Necessitatibus quibusdam qui optio cupiditate. Molestias ut ullam maxime a velit non. Eos quas fugit aliquam voluptatum et doloribus. Corporis qui qui occaecati autem tempora. Totam molestiae ut sed voluptatem.</p><p>Nostrum est enim velit at. Iure assumenda et deleniti dolor ut rerum nihil vel. Inventore voluptatem doloremque fugiat quod. Voluptates nesciunt fuga maiores autem libero adipisci similique.</p><p>Incidunt doloremque totam exercitationem qui. Veritatis et est est culpa.</p>', NULL, '2022-06-28 01:18:32', '2022-06-28 01:18:32'),
(16, 2, 3, 'Culpa recusandae quia dignissimos optio tempore voluptatem aut sed pariatur magni vel qui.', 'velit-officiis-sunt-sit-dolorum-omnis-aut-sunt', NULL, 'Vel aut exercitationem delectus. Adipisci perspiciatis illo molestiae quod sint neque.', '<p>Iusto nihil perferendis facilis excepturi sed quo. Ex aut ut aut rerum.</p><p>Quis et id accusamus explicabo. Iure amet pariatur porro quis repellendus sunt. Vel dolor tempora sunt placeat.</p><p>Laborum dicta ut quisquam a. Ipsam eos non ipsum id. Incidunt consectetur temporibus optio et qui et. Nihil totam consequatur rem voluptate.</p><p>Reprehenderit repudiandae ad quia qui. Sunt reiciendis amet aut doloremque voluptas aut. Sit velit amet aut aspernatur suscipit officia.</p><p>Aut aut distinctio aut architecto culpa dolore praesentium. Necessitatibus et et natus deleniti placeat amet corporis. Consectetur harum maxime deleniti iure atque unde neque. Dolores adipisci est laborum commodi nihil molestiae distinctio.</p><p>Est qui ex eaque. Asperiores quia commodi et voluptate dolorem error sed. Numquam maiores expedita at placeat et laborum molestiae.</p><p>Consequatur eos et maiores earum quae maiores voluptatum. Ut ut ipsum dolorum corporis omnis dicta. Quis quasi perferendis rem aut id facilis.</p>', NULL, '2022-06-28 01:18:32', '2022-06-28 01:18:32'),
(19, 1, 3, 'Quo corporis eum consectetur minus saepe et et enim ipsa non magnam ipsam adipisci sit explicabo magnam.', 'neque-perspiciatis-adipisci-debitis', NULL, 'Illo totam ipsam et possimus excepturi natus eveniet eum. Dolorem velit in dicta quam voluptas facilis expedita odio. Molestiae nisi magnam magni eos. Voluptatibus modi officiis quia rerum qui voluptates est in.', '<p>Adipisci provident dolorum nemo ut earum est mollitia. Non officiis animi iusto est. In autem dolores mollitia voluptatem. Ut minima qui nihil.</p><p>Qui in qui quis animi soluta provident atque. Aut quis nihil optio aliquid esse quasi. Natus nulla reprehenderit et laboriosam. Adipisci eos necessitatibus quia temporibus magnam.</p><p>Quis aut ut iure id labore at est. Est distinctio rerum sed et recusandae maiores pariatur. Similique expedita mollitia aut ea.</p><p>Id vel ut illo. Quia doloremque dignissimos natus explicabo consequatur eos magni. Et sequi voluptatibus nesciunt debitis atque ut odio. Eaque eveniet vel ab voluptatem maxime et. Consequatur officia autem quaerat saepe repudiandae.</p><p>Et aut aliquid omnis impedit fuga. Necessitatibus iste maxime reprehenderit repellendus ullam blanditiis nemo. Earum adipisci consequuntur accusamus. Quae quisquam quod laboriosam et. Cupiditate earum unde quis.</p><p>Omnis odit dignissimos facilis mollitia inventore qui corrupti aut. Fugiat nobis ratione repellat minus. Non eveniet reprehenderit id dolorem cumque est ut. Consequuntur assumenda iure ut dignissimos neque perferendis eos.</p><p>Distinctio quas vel nulla ducimus veritatis sint voluptatibus alias. Tenetur qui sed error enim voluptatem. Harum ullam occaecati quis cum aut quam. Voluptas itaque libero ipsa et repellendus. Et aperiam mollitia provident mollitia voluptatem.</p>', NULL, '2022-06-28 01:18:32', '2022-06-28 01:18:32'),
(20, 2, 3, 'Tempore sunt earum non qui iste.', 'et-et-aut-enim-ut-vitae-velit', NULL, 'Pariatur aut aut officiis excepturi. Dolorum in perspiciatis rem. Accusamus odit eos ut quam aspernatur. Ipsum earum aspernatur quia assumenda.', '<p>Dolore aut rem fugit doloremque voluptas in quia rerum. Quo odit dolorem quas voluptates voluptas nisi quasi. Ad inventore molestias voluptas nisi maxime.</p><p>Voluptatem consequuntur vero omnis aut soluta illum. Est non sunt iure qui. A eveniet accusantium enim rerum. Voluptas temporibus nisi harum est.</p><p>Quas non eligendi nostrum molestiae. Ea sint ut quia placeat. Quibusdam cum laborum at necessitatibus alias saepe.</p><p>Fugiat quod ipsa possimus. Qui minima aut veritatis asperiores. Fugit qui quidem reprehenderit voluptatem.</p><p>Vel officiis deserunt expedita enim eligendi. Nihil eum eligendi delectus ipsa quo. Quidem sit ut fugit voluptates soluta. Fugiat et iste ducimus similique ipsam placeat expedita. Ut est consequatur accusantium molestiae.</p><p>Hic et quo in optio. Et molestias sapiente omnis libero sed commodi eos. Quibusdam non iusto doloribus corporis et sapiente. Maxime quia temporibus cum doloribus veritatis.</p>', NULL, '2022-06-28 01:18:32', '2022-06-28 01:18:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'kevindarmawan', 'Made Kevin Darmawan', 'kevindarmawan022@gmail.com', NULL, '$2y$10$V8atmLT/A6AXAfxz8Pq1vOF34Cd1.2ef.qNdWrseS3KilFaFXiPaO', NULL, '2022-06-28 01:18:32', '2022-06-28 01:18:32', 1),
(2, 'xsusanti', 'Kemal Bagus Maryadi S.Psi', 'tina61@yahoo.co.id', '2022-06-28 01:18:32', '$2y$10$t1NOuevH3ruLPQA0qCwD4u.UaRHumhfCvtA5nLmYpLGB9GwIglk9y', 'YgWZRWwmZOwxcCsijKnmAXjHAZrLcxvJTf9ypJFbAa038dHmYyhVKybWTlun', '2022-06-28 01:18:32', '2022-06-28 01:18:32', 1),
(3, 'xusada', 'Kani Handayani S.E.', 'nababan.daru@yahoo.co.id', '2022-06-28 01:18:32', '$2y$10$pGTuIpm0Wcc5/8sHktLtl.VpFOpdwE.AHuXMp/1so2.TEEDfBmSuq', 'cMG5SjttDE', '2022-06-28 01:18:32', '2022-06-28 01:18:32', 0),
(4, 'atmaja70', 'Rina Ina Novitasari', 'cakrawangsa21@yahoo.com', '2022-06-28 01:18:32', '$2y$10$zg1KN9VDY2JZ2mT7Wk3fUuLR0nHvK4NIlmBlNezF.7gZETMIxinEu', 'oWTYUVxb3R', '2022-06-28 01:18:32', '2022-06-28 01:18:32', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`) USING HASH;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
