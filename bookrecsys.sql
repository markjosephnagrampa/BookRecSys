-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 12, 2022 at 11:54 PM
-- Server version: 5.7.39-0ubuntu0.18.04.2
-- PHP Version: 7.2.24-0ubuntu0.18.04.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookrecsys`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcement_ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `message_expiry` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_ID` int(11) NOT NULL,
  `author_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_ID`, `author_name`) VALUES
(3, 'Suzanne Collins'),
(4, 'J.K. Rowling'),
(5, 'Mary GrandPrÃ©'),
(6, 'Harper Lee'),
(7, 'Jane Austen'),
(8, 'Anna Quindlen'),
(9, 'Stephenie Meyer'),
(10, 'Markus Zusak'),
(11, 'George Orwell'),
(12, 'Russell Baker'),
(13, 'C.M. Woodhouse'),
(14, 'C.S. Lewis'),
(15, 'Pauline Baynes'),
(16, 'J.R.R. Tolkien'),
(17, 'Margaret Mitchell'),
(18, 'John Green'),
(19, 'Douglas Adams'),
(20, 'Shel Silverstein'),
(21, 'Emily BrontÃ«'),
(22, 'Richard J. Dunn'),
(23, 'David Timson'),
(24, 'Charlotte BrontÃ«'),
(25, 'Robert Heindel');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_ID` int(11) NOT NULL,
  `category_ID` int(11) DEFAULT NULL,
  `publisher_ID` int(11) NOT NULL,
  `format_ID` int(11) NOT NULL,
  `ISBN` varchar(13) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `publication_year` int(4) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `cover_image_loc` varchar(1000) NOT NULL,
  `stock_qty` int(11) NOT NULL,
  `is_for_training` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_ID`, `category_ID`, `publisher_ID`, `format_ID`, `ISBN`, `title`, `price`, `publication_year`, `description`, `cover_image_loc`, `stock_qty`, `is_for_training`, `is_deleted`) VALUES
(14, 1, 2, 1, '9780439023481', 'The Hunger Games', '350.00', 2008, 'WINNING MEANS FAME AND FORTUNE.LOSING MEANS CERTAIN DEATH.THE HUNGER GAMES HAVE BEGUN. . . .In the ruins of a place once known as North America lies the nation of Panem, a shining Capitol surrounded by twelve outlying districts. The Capitol is harsh and cruel and keeps the districts in line by forcing them all to send one boy and once girl between the ages of twelve and eighteen to participate in the annual Hunger Games, a fight to the death on live TV.Sixteen-year-old Katniss Everdeen regards it as a death sentence when she steps forward to take her sisters place in the Games. But Katniss has been close to dead beforeâ€”and survival, for her, is second nature. Without really meaning to, she becomes a contender. But if she is to win, she will have to start making choices that weight survival against humanity and life against love.', '14.jpg', 50, 1, 0),
(15, NULL, 3, 2, '9780439358071', 'Harry Potter and the Order of the Phoenix', '301.00', 2004, 'There is a door at the end of a silent corridor. And itâ€™s haunting Harry Pottterâ€™s dreams. Why else would he be waking in the middle of the night, screaming in terror?Harry has a lot on his mind for this, his fifth year at Hogwarts: a Defense Against the Dark Arts teacher with a personality like poisoned honey; a big surprise on the Gryffindor Quidditch team; and the looming terror of the Ordinary Wizarding Level exams. But all these things pale next to the growing threat of He-Who-Must-Not-Be-Named - a threat that neither the magical government nor the authorities at Hogwarts can stop.As the grasp of darkness tightens, Harry must discover the true depth and strength of his friends, the importance of boundless loyalty, and the shocking price of unbearable sacrifice.His fate depends on them all.', '15.jpg', 1, 1, 0),
(16, NULL, 4, 2, '9999999999999', 'To Kill a Mockingbird', '302.00', 2005, 'The unforgettable novel of a childhood in a sleepy Southern town and the crisis of conscience that rocked it, To Kill A Mockingbird became both an instant bestseller and a critical success when it was first published in 1960. It went on to win the Pulitzer Prize in 1961 and was later made into an Academy Award-winning film, also a classic.Compassionate, dramatic, and deeply moving, To Kill A Mockingbird takes readers to the roots of human behavior - to innocence and experience, kindness and cruelty, love and hatred, humor and pathos. Now with over 18 million copies in print and translated into forty languages, this regional story by a young Alabama woman claims universal appeal. Harper Lee always considered her book to be a simple love story. Today it is regarded as a masterpiece of American literature.', '16.jpg', 2, 1, 0),
(17, NULL, 5, 2, '9999999999999', 'Pride and Prejudice', '300.00', 2000, 'Alternate cover edition of ISBN 9780679783268Since its immediate success in 1813, Pride and Prejudice has remained one of the most popular novels in the English language. Jane Austen called this brilliant work &quot;her own darling child&quot; and its vivacious heroine, Elizabeth Bennet, &quot;as delightful a creature as ever appeared in print.&quot; The romantic clash between the opinionated Elizabeth and her proud beau, Mr. Darcy, is a splendid performance of civilized sparring. And Jane Austens radiant wit sparkles as her characters dance a delicate quadrille of flirtation and intrigue, making this book the most superb comedy of manners of Regency England.', '17.jpg', 50, 1, 0),
(18, NULL, 6, 2, '9780316015844', 'Twilight', '300.00', 2006, 'About three things I was absolutely positive.\r\n\r\nFirst, Edward was a vampire.\r\n\r\nSecond, there was a part of himâ€”and I didnt know how dominant that part might beâ€”that thirsted for my blood.\r\n\r\nAnd third, I was unconditionally and irrevocably in love with him.\r\n\r\nDeeply seductive and extraordinarily suspenseful, Twilight is a love story with bite.', '18.jpg', 50, 1, 0),
(19, NULL, 7, 1, '9780375831003', 'The Book Thief', '300.00', 2006, 'Librarians note: An alternate cover edition can be found hereIt is 1939. Nazi Germany. The country is holding its breath. Death has never been busier, and will be busier still.By her brothers graveside, Liesels life is changed when she picks up a single object, partially hidden in the snow. It is The Gravediggers Handbook, left behind there by accident, and it is her first act of book thievery. So begins a love affair with books and words, as Liesel, with the help of her accordian-playing foster father, learns to read. Soon she is stealing books from Nazi book-burnings, the mayors wifes library, wherever there are books to be found.But these are dangerous times. When Liesels foster family hides a Jew in their basement, Liesels world is both opened up, and closed down.In superbly crafted writing that burns with intensity, award-winning author Markus Zusak has given us one of the most enduring stories of our time.(Note: this title was not published as YA fiction)', '19.jpg', 50, 1, 0),
(20, NULL, 8, 3, '9780451526341', 'Animal Farm', '430.00', 1996, 'Librarians note: There is an Alternate Cover Edition for this edition of this book here.A farm is taken over by its overworked, mistreated animals. With flaming idealism and stirring slogans, they set out to create a paradise of progress, justice, and equality. Thus the stage is set for one of the most telling satiric fables ever penned â€“a razor-edged fairy tale for grown-ups that records the evolution from revolution against tyranny to a totalitarianism just as terrible. When Animal Farm was first published, Stalinist Russia was seen as its target. Today it is devastatingly clear that wherever and whenever freedom is attacked, under whatever banner, the cutting clarity and savage comedy of George Orwellâ€™s masterpiece have a meaning and message still ferociously fresh.', '20.jpg', 50, 1, 0),
(21, NULL, 9, 2, '9999999999999', 'The Chronicles of Narnia', '300.00', 2002, 'Journeys to the end of the world, fantastic creatures, and epic battles between good and evilâ€”what more could any reader ask for in one book? The book that has it all is The Lion, the Witch and the Wardrobe, written in 1949 by Clive Staples Lewis. But Lewis did not stop there. Six more books followed, and together they became known as The Chronicles of Narnia.For the past fifty years, The Chronicles of Narnia have transcended the fantasy genre to become part of the canon of classic literature. Each of the seven books is a masterpiece, drawing the reader into a land where magic meets reality, and the result is a fictional world whose scope has fascinated generations.This edition presents all seven booksâ€”unabridgedâ€”in one impressive volume. The books are presented here in chronlogical order, each chapter graced with an illustration by the original artist, Pauline Baynes. Deceptively simple and direct, The Chronicles of Narnia continue to captivate fans with adventures, character...', '21.jpg', 50, 1, 0),
(22, NULL, 10, 3, '9780345538376', 'J.R.R. Tolkien 4-Book Boxed Set: The Hobbit and The Lord of the Rings', '300.00', 2012, 'This four-volume, boxed set contains J.R.R. Tolkiens epic masterworks The Hobbit and the three volumes of The Lord of the Rings (The Fellowship of the Ring, The Two Towers, and The Return of the King).In The Hobbit, Bilbo Baggins is whisked away from his comfortable, unambitious life in Hobbiton by the wizard Gandalf and a company of dwarves. He finds himself caught up in a plot to raid the treasure hoard of Smaug the Magnificent, a large and very dangerous dragon.The Lord of the Rings tells of the great quest undertaken by Frodo Baggins and the Fellowship of the Ring: Gandalf the wizard; the hobbits Merry, Pippin, and Sam; Gimli the dwarf; Legolas the elf; Boromir of Gondor; and a tall, mysterious stranger called Strider. J.R.R. Tolkiens three volume masterpiece is at once a classic myth and a modern fairy taleâ€”a story of high and heroic adventure set in the unforgettable landscape of Middle-earth', '22.jpg', 50, 1, 0),
(23, NULL, 11, 3, '9780446675536', 'Gone with the Wind', '300.00', 1999, 'Scarlett OHara, the beautiful, spoiled daughter of a well-to-do Georgia plantation owner, must use every means at her disposal to claw her way out of the poverty she finds herself in after Shermans March to the Sea.', '23.jpg', 50, 1, 0),
(24, NULL, 12, 1, '9999999999999', 'The Fault in Our Stars', '300.00', 2012, 'Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis. But when a gorgeous plot twist named Augustus Waters suddenly appears at Cancer Kid Support Group, Hazels story is about to be completely rewritten.Insightful, bold, irreverent, and raw, The Fault in Our Stars is award-winning author John Greens most ambitious and heartbreaking work yet, brilliantly exploring the funny, thrilling, and tragic business of being alive and in love.', '24.jpg', 50, 1, 0),
(25, NULL, 13, 2, '9999999999999', 'The Hitchhikers Guide to the Galaxy', '300.00', 2007, 'Seconds before the Earth is demolished to make way for a galactic freeway, Arthur Dent is plucked off the planet by his friend Ford Prefect, a researcher for the revised edition of The Hitchhikers Guide to the Galaxy who, for the last fifteen years, has been posing as an out-of-work actor.Together this dynamic pair begin a journey through space aided by quotes from The Hitchhikers Guide (&quot;A towel is about the most massively useful thing an interstellar hitchhiker can have&quot;) and a galaxy-full of fellow travelers: Zaphod Beeblebroxâ€”the two-headed, three-armed ex-hippie and totally out-to-lunch president of the galaxy; Trillian, Zaphods girlfriend (formally Tricia McMillan), whom Arthur tried to pick up at a cocktail party once upon a time zone; Marvin, a paranoid, brilliant, and chronically depressed robot; Veet Voojagig, a former graduate student who is obsessed with the disappearance of all the ballpoint pens he bought over the years.', '25.jpg', 50, 1, 0),
(26, NULL, 14, 1, '9780060256654', 'The Giving Tree', '300.00', 1964, '&quot;Once there was a tree...and she loved a little boy.&quot;So begins a story of unforgettable perception, beautifully written and illustrated by the gifted and versatile Shel Silverstein.Every day the boy would come to the tree to eat her apples, swing from her branches, or slide down her trunk...and the tree was happy. But as the boy grew older he began to want more from the tree, and the tree gave and gave and gave.This is a tender story, touched with sadness, aglow with consolation. Shel Silverstein has created a moving parable for readers of all ages that offers an affecting interpretation of the gift of giving and a serene acceptance of anothers capacity to love in return.', '26.jpg', 50, 1, 0),
(27, NULL, 16, 2, '9780393978896', 'Wuthering Heights', '300.00', 2002, 'You can find the redesigned cover of this edition HERE.This best-selling Norton Critical Edition is based on the 1847 first edition of the novel. For the Fourth Edition, the editor has collated the 1847 text with several modern editions and has corrected a number of variants, including accidentals. The text is accompanied by entirely new explanatory annotations.New to the fourth Edition are twelve of Emily Brontes letters regarding the publication of the 1847 edition of Wuthering Heights as well as the evolution of the 1850 edition, prose and poetry selections by the author, four reviews of the novel, and poetry selections by the author, four reviews of the novel, and Edward Chithams insightful and informative chronology of the creative process behind the beloved work.Five major critical interpretations of Wuthering Heights are included, three of them new to the Fourth Edition. A Stuart Daley considers the importance of chronology in the novel. J. Hillis Miller examines Wuthering He...', '27.jpg', 50, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `book_authors`
--

CREATE TABLE `book_authors` (
  `book_author_ID` int(11) NOT NULL,
  `book_ID` int(11) NOT NULL,
  `author_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_authors`
--

INSERT INTO `book_authors` (`book_author_ID`, `book_ID`, `author_ID`) VALUES
(8, 14, 3),
(9, 15, 4),
(10, 15, 5),
(11, 16, 6),
(12, 17, 7),
(13, 17, 8),
(14, 18, 9),
(15, 19, 10),
(19, 21, 14),
(20, 22, 16),
(21, 23, 17),
(22, 24, 18),
(23, 25, 19),
(24, 26, 20),
(73, 20, 11),
(74, 20, 12),
(75, 20, 13),
(81, 27, 21),
(82, 27, 22),
(83, 27, 23),
(84, 27, 24),
(85, 27, 25);

-- --------------------------------------------------------

--
-- Table structure for table `book_genres`
--

CREATE TABLE `book_genres` (
  `book_genres_ID` int(11) NOT NULL,
  `book_ID` int(11) NOT NULL,
  `genre_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_genres`
--

INSERT INTO `book_genres` (`book_genres_ID`, `book_ID`, `genre_ID`) VALUES
(62, 14, 33),
(63, 14, 34),
(64, 14, 35),
(65, 14, 36),
(66, 14, 37),
(67, 14, 38),
(68, 14, 39),
(69, 14, 40),
(70, 14, 41),
(71, 14, 42),
(72, 15, 36),
(73, 15, 33),
(74, 15, 34),
(75, 15, 43),
(76, 15, 44),
(77, 15, 39),
(78, 15, 45),
(79, 15, 46),
(80, 15, 47),
(81, 15, 48),
(82, 16, 47),
(83, 16, 34),
(84, 16, 49),
(85, 16, 50),
(86, 16, 51),
(87, 16, 33),
(88, 16, 52),
(89, 16, 53),
(90, 16, 54),
(91, 16, 55),
(92, 17, 47),
(93, 17, 34),
(94, 17, 38),
(95, 17, 49),
(96, 17, 51),
(97, 17, 52),
(98, 17, 53),
(99, 17, 56),
(100, 17, 57),
(101, 17, 58),
(102, 18, 33),
(103, 18, 36),
(104, 18, 38),
(105, 18, 59),
(106, 18, 34),
(107, 18, 60),
(108, 18, 61),
(109, 18, 62),
(110, 18, 40),
(111, 18, 63),
(112, 19, 49),
(113, 19, 34),
(114, 19, 33),
(115, 19, 52),
(116, 19, 47),
(117, 19, 64),
(118, 19, 65),
(119, 19, 66),
(120, 19, 67),
(121, 19, 45),
(132, 21, 36),
(133, 21, 47),
(134, 21, 34),
(135, 21, 33),
(136, 21, 44),
(137, 21, 69),
(138, 21, 39),
(139, 21, 48),
(140, 21, 46),
(141, 21, 70),
(142, 22, 36),
(143, 22, 34),
(144, 22, 47),
(145, 22, 39),
(146, 22, 48),
(147, 22, 71),
(148, 22, 72),
(149, 22, 33),
(150, 22, 51),
(151, 22, 43),
(152, 23, 47),
(153, 23, 49),
(154, 23, 34),
(155, 23, 38),
(156, 23, 52),
(157, 23, 64),
(158, 23, 51),
(159, 23, 73),
(160, 23, 56),
(161, 23, 53),
(162, 24, 33),
(163, 24, 38),
(164, 24, 34),
(165, 24, 74),
(166, 24, 75),
(167, 24, 40),
(168, 24, 76),
(169, 24, 77),
(170, 24, 53),
(171, 24, 78),
(172, 25, 37),
(173, 25, 34),
(174, 25, 79),
(175, 25, 36),
(176, 25, 47),
(177, 25, 80),
(178, 25, 48),
(179, 25, 45),
(180, 25, 39),
(181, 25, 53),
(182, 25, 81),
(183, 26, 44),
(184, 26, 82),
(185, 26, 47),
(186, 26, 34),
(187, 26, 83),
(188, 26, 33),
(189, 26, 36),
(190, 26, 84),
(191, 26, 85),
(192, 26, 86),
(193, 26, 81),
(294, 20, 47),
(295, 20, 34),
(296, 20, 35),
(297, 20, 36),
(298, 20, 51),
(299, 20, 68),
(300, 20, 50),
(301, 20, 37),
(302, 20, 53),
(303, 20, 54),
(314, 27, 47),
(315, 27, 34),
(316, 27, 38),
(317, 27, 87),
(318, 27, 51),
(319, 27, 49),
(320, 27, 89),
(321, 27, 53),
(322, 27, 57),
(323, 27, 52);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_item_ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `book_ID` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_ID` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_ID`, `category_name`) VALUES
(2, 'Featured Collections'),
(1, 'Staff Picks');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `book_ID` int(11) NOT NULL,
  `event_type_ID` int(11) NOT NULL,
  `datetime_occurred` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event_types`
--

CREATE TABLE `event_types` (
  `event_type_ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `weight` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `formats`
--

CREATE TABLE `formats` (
  `format_ID` int(11) NOT NULL,
  `format_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formats`
--

INSERT INTO `formats` (`format_ID`, `format_name`) VALUES
(1, 'Hardcover'),
(3, 'Mass Market Paperback'),
(2, 'Paperback');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genre_ID` int(11) NOT NULL,
  `genre_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre_ID`, `genre_name`) VALUES
(81, ''),
(89, '18th Century'),
(88, '19th Century'),
(42, 'Action'),
(58, 'Adult'),
(39, 'Adventure'),
(45, 'Audiobook'),
(67, 'Books About Books'),
(44, 'Childrens'),
(69, 'Christian'),
(70, 'Christian Fiction'),
(73, 'Civil War'),
(57, 'Classic Literature'),
(47, 'Classics'),
(80, 'Comedy'),
(76, 'Coming of Age'),
(74, 'Contemporary'),
(77, 'Drama'),
(35, 'Dystopia'),
(71, 'Epic Fantasy'),
(36, 'Fantasy'),
(34, 'Fiction'),
(87, 'Gothic'),
(72, 'High Fantasy'),
(55, 'High School'),
(52, 'Historical'),
(49, 'Historical Fiction'),
(56, 'Historical Romance'),
(65, 'Holocaust'),
(79, 'Humor'),
(84, 'Juvenile'),
(85, 'Kids'),
(51, 'Literature'),
(78, 'Love'),
(43, 'Magic'),
(46, 'Middle Grade'),
(53, 'Novels'),
(60, 'Paranormal'),
(61, 'Paranormal Romance'),
(82, 'Picture Books'),
(83, 'Poetry'),
(68, 'Politics'),
(41, 'Post Apocalyptic'),
(54, 'Read For School'),
(75, 'Realistic Fiction'),
(38, 'Romance'),
(50, 'School'),
(37, 'Science Fiction'),
(48, 'Science Fiction Fantasy'),
(86, 'Short Stories'),
(62, 'Supernatural'),
(40, 'Teen'),
(63, 'Urban Fantasy'),
(59, 'Vampires'),
(64, 'War'),
(66, 'World War II'),
(33, 'Young Adult');

-- --------------------------------------------------------

--
-- Table structure for table `impressions`
--

CREATE TABLE `impressions` (
  `impression_ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `publisher_ID` int(11) NOT NULL,
  `publisher_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`publisher_ID`, `publisher_name`) VALUES
(7, 'Alfred A. Knopf'),
(10, 'Ballantine Books'),
(13, 'Del Rey'),
(12, 'Dutton Books'),
(4, 'Harper Perennial Modern Classics'),
(9, 'HarperCollins'),
(14, 'HarperCollins Publishers'),
(6, 'Little, Brown and Company'),
(5, 'Modern Library'),
(16, 'Norton'),
(1, 'Penguin Random House'),
(3, 'Scholastic Inc.'),
(2, 'Scholastic Press'),
(8, 'Signet Classics'),
(15, 'Singet Classics'),
(11, 'Warner Books');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `shipping_address` varchar(1000) NOT NULL,
  `datetime` datetime NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `change_for` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_items`
--

CREATE TABLE `transaction_items` (
  `transaction_item_ID` int(11) NOT NULL,
  `transaction_ID` int(11) NOT NULL,
  `book_ID` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_ID` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email_address` varchar(200) NOT NULL,
  `password` varchar(64) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `date_inserted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_ID`, `first_name`, `last_name`, `email_address`, `password`, `city`, `state`, `country`, `is_active`, `is_deleted`, `is_admin`, `date_inserted`) VALUES
(1, 'Mark', 'Nagrampa', 'marknagrampa489@gmail.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Las Pinas City', 'Metro Manila', 'Philippines', 1, 0, 1, '2022-07-19'),
(13, 'John', 'Doe', 'johndoe@gmail.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Makati', 'National Capital Region', 'Philippines', 1, 0, 0, '2022-07-19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_ID`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_ID`),
  ADD KEY `category_ID` (`category_ID`),
  ADD KEY `publisher_ID` (`publisher_ID`),
  ADD KEY `format_ID` (`format_ID`);

--
-- Indexes for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD PRIMARY KEY (`book_author_ID`),
  ADD KEY `book_ID` (`book_ID`),
  ADD KEY `author_ID` (`author_ID`);

--
-- Indexes for table `book_genres`
--
ALTER TABLE `book_genres`
  ADD PRIMARY KEY (`book_genres_ID`),
  ADD KEY `book_ID` (`book_ID`),
  ADD KEY `genre_ID` (`genre_ID`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_item_ID`),
  ADD KEY `user_ID` (`user_ID`),
  ADD KEY `book_ID` (`book_ID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_ID`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_ID`),
  ADD KEY `user_ID` (`user_ID`),
  ADD KEY `book_ID` (`book_ID`),
  ADD KEY `event_type_ID` (`event_type_ID`);

--
-- Indexes for table `event_types`
--
ALTER TABLE `event_types`
  ADD PRIMARY KEY (`event_type_ID`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `formats`
--
ALTER TABLE `formats`
  ADD PRIMARY KEY (`format_ID`),
  ADD UNIQUE KEY `format_name` (`format_name`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_ID`),
  ADD UNIQUE KEY `genre_name` (`genre_name`);

--
-- Indexes for table `impressions`
--
ALTER TABLE `impressions`
  ADD PRIMARY KEY (`impression_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`publisher_ID`),
  ADD UNIQUE KEY `publisher_name` (`publisher_name`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD PRIMARY KEY (`transaction_item_ID`),
  ADD KEY `transaction_ID` (`transaction_ID`),
  ADD KEY `book_ID` (`book_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_ID`),
  ADD UNIQUE KEY `email_address` (`email_address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `book_authors`
--
ALTER TABLE `book_authors`
  MODIFY `book_author_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT for table `book_genres`
--
ALTER TABLE `book_genres`
  MODIFY `book_genres_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;
--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_item_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_types`
--
ALTER TABLE `event_types`
  MODIFY `event_type_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `formats`
--
ALTER TABLE `formats`
  MODIFY `format_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `impressions`
--
ALTER TABLE `impressions`
  MODIFY `impression_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `publisher_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transaction_items`
--
ALTER TABLE `transaction_items`
  MODIFY `transaction_item_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`user_ID`);

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_ID`) REFERENCES `categories` (`category_ID`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`publisher_ID`) REFERENCES `publishers` (`publisher_ID`),
  ADD CONSTRAINT `books_ibfk_3` FOREIGN KEY (`format_ID`) REFERENCES `formats` (`format_ID`);

--
-- Constraints for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`book_ID`) REFERENCES `books` (`book_ID`),
  ADD CONSTRAINT `book_authors_ibfk_2` FOREIGN KEY (`author_ID`) REFERENCES `authors` (`author_ID`);

--
-- Constraints for table `book_genres`
--
ALTER TABLE `book_genres`
  ADD CONSTRAINT `book_genres_ibfk_1` FOREIGN KEY (`genre_ID`) REFERENCES `genres` (`genre_ID`),
  ADD CONSTRAINT `book_genres_ibfk_2` FOREIGN KEY (`book_ID`) REFERENCES `books` (`book_ID`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`user_ID`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`book_ID`) REFERENCES `books` (`book_ID`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`user_ID`),
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`book_ID`) REFERENCES `books` (`book_ID`),
  ADD CONSTRAINT `events_ibfk_3` FOREIGN KEY (`event_type_ID`) REFERENCES `event_types` (`event_type_ID`);

--
-- Constraints for table `impressions`
--
ALTER TABLE `impressions`
  ADD CONSTRAINT `impressions_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`user_ID`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`user_ID`);

--
-- Constraints for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD CONSTRAINT `transaction_items_ibfk_1` FOREIGN KEY (`transaction_ID`) REFERENCES `transactions` (`transaction_ID`),
  ADD CONSTRAINT `transaction_items_ibfk_2` FOREIGN KEY (`book_ID`) REFERENCES `books` (`book_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
