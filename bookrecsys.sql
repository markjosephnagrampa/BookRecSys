-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 23, 2022 at 09:14 PM
-- Server version: 5.7.40-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.15

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

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`announcement_ID`, `user_ID`, `message`, `message_expiry`) VALUES
(1, 1, 'Test', '2022-08-17 14:15:00'),
(3, 1, 'We would be performing scheduled server maintenance on August 31, 2022 from 12:30PM - 2:30PM. The website would be unavailable during this period.', '2022-08-17 17:30:00');

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
(25, 'Robert Heindel'),
(26, 'Dan Brown'),
(27, 'Arthur Golden'),
(28, 'Oscar Wilde'),
(29, 'Jeffrey Eugenides'),
(30, 'Lewis Carroll'),
(31, 'John Tenniel'),
(32, 'Martin Gardner'),
(33, 'Michael Mason'),
(34, 'Barnett Freedman'),
(35, 'Victor Hugo'),
(36, 'Lee Fahnestock'),
(37, 'Norman MacAfee'),
(38, 'Ray Bradbury'),
(39, 'Veronica Roth'),
(40, 'William Golding'),
(41, 'William Shakespeare'),
(42, 'Paul Werstine'),
(43, 'Barbara A. Mowat'),
(44, 'Paavo Emil Cajander'),
(45, 'Paulo Coelho'),
(46, 'Alan R. Clarke'),
(47, 'James Noel Smith'),
(48, 'Fyodor Dostoyevsky'),
(49, 'David McDuff'),
(50, 'Stephen Chbosky'),
(51, 'Francis Scott Fitzgerald'),
(52, 'Cassandra Clare'),
(53, 'Orson Scott Card'),
(54, 'Stefan Rudnicki'),
(55, 'Harlan Ellison'),
(56, 'Kathryn Stockett'),
(57, 'L.M. Montgomery'),
(58, 'Antoine de Saint-ExupÃ©ry'),
(59, 'Richard Howard'),
(60, 'Ivan Minatti'),
(61, 'Nguyá»…n ThÃ nh VÅ©'),
(62, 'E.B. White'),
(63, 'Garth Williams'),
(64, 'Rosemary Wells'),
(65, 'John Steinbeck'),
(66, 'Audrey Niffenegger'),
(67, 'Bram Stoker'),
(68, 'Nina Auerbach'),
(69, 'David J. Skal'),
(70, 'Aldous Huxley'),
(71, 'Gabriel GarcÃ­a MÃ¡rquez'),
(72, 'Gregory Rabassa'),
(73, 'J.D. Salinger'),
(74, 'William Goldman'),
(75, 'Rick Riordan'),
(76, 'Frances Hodgson Burnett'),
(77, 'Khaled Hosseini'),
(78, 'Madeleine LEngle'),
(79, 'George R.R. Martin'),
(80, 'Mark Twain'),
(81, 'Guy Cardwell'),
(82, 'John Seelye'),
(83, 'Walter Trier'),
(84, 'Alice Sebold'),
(85, 'S.E. Hinton'),
(86, 'Maurice Sendak'),
(87, 'Dr. Seuss'),
(88, 'Homer'),
(89, 'Robert Fagles'),
(90, 'Bernard Knox'),
(91, 'Yann Martel'),
(92, 'Charles Dickens'),
(93, 'Richard Maxwell'),
(94, 'Sara Gruen'),
(95, 'Vladimir Nabokov'),
(96, 'Craig Raine'),
(97, 'Kurt Vonnegut Jr.'),
(98, 'Mary Wollstonecraft Shelley'),
(99, 'Charlotte Gordon'),
(100, 'Berliani M. Nugrahani'),
(101, 'Margaret Atwood'),
(102, 'Lois Lowry'),
(103, 'Joseph Heller'),
(104, 'Frank Herbert'),
(105, 'Ken Follett'),
(106, 'Stephen King'),
(107, 'Bernie Wrightson'),
(108, 'Arthur Conan Doyle'),
(109, 'Richard Adams'),
(110, 'Î Î±Ï…Î»Î¯Î½Î± Î Î±Î¼Ï€Î¿ÏÎ´Î·'),
(111, 'Marisa Sestino'),
(112, 'Louisa May Alcott'),
(113, 'Sylvia Plath'),
(114, 'Ken Kesey'),
(115, 'Leo Tolstoy'),
(116, 'Aylmer Maude'),
(117, 'Lev Tolstoi'),
(118, 'Louise Maude'),
(119, 'George Gibian'),
(120, 'Diana Gabaldon'),
(121, 'Jodi Picoult'),
(122, 'Roald Dahl'),
(123, 'Quentin Blake'),
(124, 'Stieg Larsson'),
(125, 'Reg Keeland'),
(126, 'Daphne du Maurier'),
(127, 'Alice Walker'),
(128, 'Betty Smith'),
(129, 'Anthony Burgess'),
(130, 'Cormac McCarthy'),
(131, 'Richard Pevear'),
(132, 'Larissa Volokhonsky'),
(133, 'Frank McCourt'),
(134, 'Richelle Mead'),
(135, 'Hermann Hesse'),
(136, 'Hilda Rosner'),
(137, 'Barbara Kingsolver'),
(138, 'Philip Pullman'),
(139, 'Miguel de Cervantes Saavedra'),
(140, 'John Rutherford'),
(141, 'Roberto GonzÃ¡lez EchevarrÃ­a'),
(142, 'Ayn Rand'),
(143, 'Leonard Peikoff'),
(144, 'Ernest Hemingway'),
(145, 'Nicholas Sparks'),
(146, 'A.A. Milne'),
(147, 'Ernest H. Shepard'),
(148, 'Edgar Allan Poe'),
(149, 'Anne Rice'),
(150, 'John Irving'),
(151, 'Herman Melville'),
(152, 'Andrew Delbanco'),
(153, 'Tom Quirk'),
(154, 'Rockwell Kent');

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
  `popularity_score` int(11) DEFAULT '0',
  `description` varchar(1000) DEFAULT NULL,
  `cover_image_loc` varchar(1000) NOT NULL,
  `stock_qty` int(11) NOT NULL,
  `is_for_training` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_ID`, `category_ID`, `publisher_ID`, `format_ID`, `ISBN`, `title`, `price`, `publication_year`, `popularity_score`, `description`, `cover_image_loc`, `stock_qty`, `is_for_training`, `is_deleted`) VALUES
(14, 1, 2, 1, '9780439023481', 'The Hunger Games', '350.00', 2008, 0, 'WINNING MEANS FAME AND FORTUNE.LOSING MEANS CERTAIN DEATH.THE HUNGER GAMES HAVE BEGUN. . . .In the ruins of a place once known as North America lies the nation of Panem, a shining Capitol surrounded by twelve outlying districts. The Capitol is harsh and cruel and keeps the districts in line by forcing them all to send one boy and once girl between the ages of twelve and eighteen to participate in the annual Hunger Games, a fight to the death on live TV.Sixteen-year-old Katniss Everdeen regards it as a death sentence when she steps forward to take her sisters place in the Games. But Katniss has been close to dead beforeâ€”and survival, for her, is second nature. Without really meaning to, she becomes a contender. But if she is to win, she will have to start making choices that weight survival against humanity and life against love.', '14.jpg', 50, 1, 0),
(15, NULL, 3, 2, '9780439358071', 'Harry Potter and the Order of the Phoenix', '301.00', 2004, 0, 'There is a door at the end of a silent corridor. And itâ€™s haunting Harry Pottterâ€™s dreams. Why else would he be waking in the middle of the night, screaming in terror?Harry has a lot on his mind for this, his fifth year at Hogwarts: a Defense Against the Dark Arts teacher with a personality like poisoned honey; a big surprise on the Gryffindor Quidditch team; and the looming terror of the Ordinary Wizarding Level exams. But all these things pale next to the growing threat of He-Who-Must-Not-Be-Named - a threat that neither the magical government nor the authorities at Hogwarts can stop.As the grasp of darkness tightens, Harry must discover the true depth and strength of his friends, the importance of boundless loyalty, and the shocking price of unbearable sacrifice.His fate depends on them all.', '15.jpg', 1, 1, 0),
(16, NULL, 4, 2, '9999999999999', 'To Kill a Mockingbird', '302.00', 2005, 0, 'The unforgettable novel of a childhood in a sleepy Southern town and the crisis of conscience that rocked it, To Kill A Mockingbird became both an instant bestseller and a critical success when it was first published in 1960. It went on to win the Pulitzer Prize in 1961 and was later made into an Academy Award-winning film, also a classic.Compassionate, dramatic, and deeply moving, To Kill A Mockingbird takes readers to the roots of human behavior - to innocence and experience, kindness and cruelty, love and hatred, humor and pathos. Now with over 18 million copies in print and translated into forty languages, this regional story by a young Alabama woman claims universal appeal. Harper Lee always considered her book to be a simple love story. Today it is regarded as a masterpiece of American literature.', '16.jpg', 2, 1, 0),
(17, NULL, 5, 2, '9999999999999', 'Pride and Prejudice', '300.00', 2000, 0, 'Alternate cover edition of ISBN 9780679783268Since its immediate success in 1813, Pride and Prejudice has remained one of the most popular novels in the English language. Jane Austen called this brilliant work &quot;her own darling child&quot; and its vivacious heroine, Elizabeth Bennet, &quot;as delightful a creature as ever appeared in print.&quot; The romantic clash between the opinionated Elizabeth and her proud beau, Mr. Darcy, is a splendid performance of civilized sparring. And Jane Austens radiant wit sparkles as her characters dance a delicate quadrille of flirtation and intrigue, making this book the most superb comedy of manners of Regency England.', '17.jpg', 50, 1, 0),
(18, NULL, 6, 2, '9780316015844', 'Twilight', '300.00', 2006, 0, 'About three things I was absolutely positive.\r\n\r\nFirst, Edward was a vampire.\r\n\r\nSecond, there was a part of himâ€”and I didnt know how dominant that part might beâ€”that thirsted for my blood.\r\n\r\nAnd third, I was unconditionally and irrevocably in love with him.\r\n\r\nDeeply seductive and extraordinarily suspenseful, Twilight is a love story with bite.', '18.jpg', 50, 1, 0),
(19, NULL, 7, 1, '9780375831003', 'The Book Thief', '300.00', 2006, 0, 'Librarians note: An alternate cover edition can be found hereIt is 1939. Nazi Germany. The country is holding its breath. Death has never been busier, and will be busier still.By her brothers graveside, Liesels life is changed when she picks up a single object, partially hidden in the snow. It is The Gravediggers Handbook, left behind there by accident, and it is her first act of book thievery. So begins a love affair with books and words, as Liesel, with the help of her accordian-playing foster father, learns to read. Soon she is stealing books from Nazi book-burnings, the mayors wifes library, wherever there are books to be found.But these are dangerous times. When Liesels foster family hides a Jew in their basement, Liesels world is both opened up, and closed down.In superbly crafted writing that burns with intensity, award-winning author Markus Zusak has given us one of the most enduring stories of our time.(Note: this title was not published as YA fiction)', '19.jpg', 50, 1, 0),
(20, NULL, 8, 3, '9780451526341', 'Animal Farm', '430.00', 1996, 0, 'Librarians note: There is an Alternate Cover Edition for this edition of this book here.A farm is taken over by its overworked, mistreated animals. With flaming idealism and stirring slogans, they set out to create a paradise of progress, justice, and equality. Thus the stage is set for one of the most telling satiric fables ever penned â€“a razor-edged fairy tale for grown-ups that records the evolution from revolution against tyranny to a totalitarianism just as terrible. When Animal Farm was first published, Stalinist Russia was seen as its target. Today it is devastatingly clear that wherever and whenever freedom is attacked, under whatever banner, the cutting clarity and savage comedy of George Orwellâ€™s masterpiece have a meaning and message still ferociously fresh.', '20.jpg', 50, 1, 0),
(21, NULL, 9, 2, '9999999999999', 'The Chronicles of Narnia', '300.00', 2002, 0, 'Journeys to the end of the world, fantastic creatures, and epic battles between good and evilâ€”what more could any reader ask for in one book? The book that has it all is The Lion, the Witch and the Wardrobe, written in 1949 by Clive Staples Lewis. But Lewis did not stop there. Six more books followed, and together they became known as The Chronicles of Narnia.For the past fifty years, The Chronicles of Narnia have transcended the fantasy genre to become part of the canon of classic literature. Each of the seven books is a masterpiece, drawing the reader into a land where magic meets reality, and the result is a fictional world whose scope has fascinated generations.This edition presents all seven booksâ€”unabridgedâ€”in one impressive volume. The books are presented here in chronlogical order, each chapter graced with an illustration by the original artist, Pauline Baynes. Deceptively simple and direct, The Chronicles of Narnia continue to captivate fans with adventures, character...', '21.jpg', 50, 1, 0),
(22, NULL, 10, 3, '9780345538376', 'J.R.R. Tolkien 4-Book Boxed Set: The Hobbit and The Lord of the Rings', '300.00', 2012, 0, 'This four-volume, boxed set contains J.R.R. Tolkiens epic masterworks The Hobbit and the three volumes of The Lord of the Rings (The Fellowship of the Ring, The Two Towers, and The Return of the King).In The Hobbit, Bilbo Baggins is whisked away from his comfortable, unambitious life in Hobbiton by the wizard Gandalf and a company of dwarves. He finds himself caught up in a plot to raid the treasure hoard of Smaug the Magnificent, a large and very dangerous dragon.The Lord of the Rings tells of the great quest undertaken by Frodo Baggins and the Fellowship of the Ring: Gandalf the wizard; the hobbits Merry, Pippin, and Sam; Gimli the dwarf; Legolas the elf; Boromir of Gondor; and a tall, mysterious stranger called Strider. J.R.R. Tolkiens three volume masterpiece is at once a classic myth and a modern fairy taleâ€”a story of high and heroic adventure set in the unforgettable landscape of Middle-earth', '22.jpg', 50, 1, 0),
(23, NULL, 11, 3, '9780446675536', 'Gone with the Wind', '300.00', 1999, 0, 'Scarlett OHara, the beautiful, spoiled daughter of a well-to-do Georgia plantation owner, must use every means at her disposal to claw her way out of the poverty she finds herself in after Shermans March to the Sea.', '23.jpg', 50, 1, 0),
(24, NULL, 12, 1, '9999999999999', 'The Fault in Our Stars', '300.00', 2012, 0, 'Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis. But when a gorgeous plot twist named Augustus Waters suddenly appears at Cancer Kid Support Group, Hazels story is about to be completely rewritten.Insightful, bold, irreverent, and raw, The Fault in Our Stars is award-winning author John Greens most ambitious and heartbreaking work yet, brilliantly exploring the funny, thrilling, and tragic business of being alive and in love.', '24.jpg', 50, 1, 0),
(25, NULL, 13, 2, '9999999999999', 'The Hitchhikers Guide to the Galaxy', '300.00', 2007, 0, 'Seconds before the Earth is demolished to make way for a galactic freeway, Arthur Dent is plucked off the planet by his friend Ford Prefect, a researcher for the revised edition of The Hitchhikers Guide to the Galaxy who, for the last fifteen years, has been posing as an out-of-work actor.Together this dynamic pair begin a journey through space aided by quotes from The Hitchhikers Guide (&quot;A towel is about the most massively useful thing an interstellar hitchhiker can have&quot;) and a galaxy-full of fellow travelers: Zaphod Beeblebroxâ€”the two-headed, three-armed ex-hippie and totally out-to-lunch president of the galaxy; Trillian, Zaphods girlfriend (formally Tricia McMillan), whom Arthur tried to pick up at a cocktail party once upon a time zone; Marvin, a paranoid, brilliant, and chronically depressed robot; Veet Voojagig, a former graduate student who is obsessed with the disappearance of all the ballpoint pens he bought over the years.', '25.jpg', 50, 1, 0),
(26, NULL, 14, 1, '9780060256654', 'The Giving Tree', '300.00', 1964, 0, '&quot;Once there was a tree...and she loved a little boy.&quot;So begins a story of unforgettable perception, beautifully written and illustrated by the gifted and versatile Shel Silverstein.Every day the boy would come to the tree to eat her apples, swing from her branches, or slide down her trunk...and the tree was happy. But as the boy grew older he began to want more from the tree, and the tree gave and gave and gave.This is a tender story, touched with sadness, aglow with consolation. Shel Silverstein has created a moving parable for readers of all ages that offers an affecting interpretation of the gift of giving and a serene acceptance of anothers capacity to love in return.', '26.jpg', 50, 1, 0),
(27, NULL, 16, 2, '9780393978896', 'Wuthering Heights', '300.00', 2002, 0, 'You can find the redesigned cover of this edition HERE.This best-selling Norton Critical Edition is based on the 1847 first edition of the novel. For the Fourth Edition, the editor has collated the 1847 text with several modern editions and has corrected a number of variants, including accidentals. The text is accompanied by entirely new explanatory annotations.New to the fourth Edition are twelve of Emily Brontes letters regarding the publication of the 1847 edition of Wuthering Heights as well as the evolution of the 1850 edition, prose and poetry selections by the author, four reviews of the novel, and poetry selections by the author, four reviews of the novel, and Edward Chithams insightful and informative chronology of the creative process behind the beloved work.Five major critical interpretations of Wuthering Heights are included, three of them new to the Fourth Edition. A Stuart Daley considers the importance of chronology in the novel. J. Hillis Miller examines Wuthering He...', '27.jpg', 50, 1, 0),
(28, 3, 17, 2, '9999999999999', 'The Da Vinci Code', '320.00', 2006, 0, 'ISBN 9780307277671 moved to this edition.While in Paris, Harvard symbologist Robert Langdon is awakened by a phone call in the dead of the night. The elderly curator of the Louvre has been murdered inside the museum, his body covered in baffling symbols. As Langdon and gifted French cryptologist Sophie Neveu sort through the bizarre riddles, they are stunned to discover a trail of clues hidden in the works of Leonardo da Vinciâ€”clues visible for all to see and yet ingeniously disguised by the painter.Even more startling, the late curator was involved in the Priory of Sionâ€”a secret society whose members included Sir Isaac Newton, Victor Hugo, and Da Vinciâ€”and he guarded a breathtaking historical secret. Unless Langdon and Neveu can decipher the labyrinthine puzzleâ€”while avoiding the faceless adversary who shadows their every moveâ€”the explosive, ancient truth will be lost forever.', '28.jpg', 50, 1, 0),
(29, NULL, 18, 3, '9781400096893', 'Memoirs of a Geisha', '321.00', 2005, 0, 'A literary sensation and runaway bestseller, this brilliant debut novel presents with seamless authenticity and exquisite lyricism the true confessions of one of Japans most celebrated geisha.In Memoirs of a Geisha, we enter a world where appearances are paramount; where a girls virginity is auctioned to the highest bidder; where women are trained to beguile the most powerful men; and where love is scorned as illusion. It is a unique and triumphant work of fiction - at once romantic, erotic, suspenseful - and completely unforgettable.', '29.jpg', 30, 1, 0),
(30, NULL, 19, 2, '9999999999999', 'The Picture of Dorian Gray', '392.00', 2004, 0, 'Written in his distinctively dazzling manner, Oscar Wildeâ€™s story of a fashionable young man who sells his soul for eternal youth and beauty is the authorâ€™s most popular work. The tale of Dorian Grayâ€™s moral disintegration caused a scandal when it ï¬rst appeared in 1890, but though Wilde was attacked for the novelâ€™s corrupting inï¬‚uence, he responded that there is, in fact, â€œa terrible moral in Dorian Gray.â€ Just a few years later, the book and the aesthetic/moral dilemma it presented became issues in the trials occasioned by Wildeâ€™s homosexual liaisons, which resulted in his imprisonment. Of Dorian Grayâ€™s relationship to autobiography, Wilde noted in a letter, â€œBasil Hallward is what I think I am: Lord Henry what the world thinks me: Dorian what I would like to beâ€”in other ages, perhaps.', '30.jpg', 20, 1, 0),
(31, NULL, 20, 2, '9780451527745', 'Alices Adventures in Wonderland &amp; Through the Looking-Glass', '372.00', 2000, 0, '&quot;I cant explain myself, Im afraid, sir,&quot; said Alice, &quot;Because Im not myself, you see.&quot;When Alice sees a white rabbit take a watch out of its waistcoat pocket she decides to follow it, and a sequence of most unusual events is set in motion. This mini book contains the entire topsy-turvy stories of Alices Adventures in Wonderland and Through the Looking-Glass, accompanied by practical notes and Martina Pelousos memorable full-colour illustrations.', '31.jpg', 28, 1, 0),
(32, NULL, 21, 2, '9780142437209', 'Jane Eyre', '350.00', 2003, 0, 'Orphaned as a child, Jane has felt an outcast her whole young life. Her courage is tested once again when she arrives at Thornfield Hall, where she has been hired by the brooding, proud Edward Rochester to care for his ward AdÃ¨le. Jane finds herself drawn to his troubled yet kind spirit. She falls in love. Hard. But there is a terrifying secret inside the gloomy, forbidding Thornfield Hall. Is Rochester hiding from Jane? Will Jane be left heartbroken and exiled once again?', '32.jpg', 50, 1, 0),
(33, NULL, 8, 3, '9999999999999', 'Les MisÃ©rables', '350.00', 1987, 0, 'Introducing one of the most famous characters in literature, Jean Valjeanâ€”the noble peasant imprisoned for stealing a loaf of breadâ€”Les MisÃ©rables ranks among the greatest novels of all time. In it, Victor Hugo takes readers deep into the Parisian underworld, immerses them in a battle between good and evil, and carries them to the barricades during the uprising of 1832 with a breathtaking realism that is unsurpassed in modern prose. Within his dramatic story are themes that capture the intellect and the emotions: crime and punishment, the relentless persecution of Valjean by Inspector Javert, the desperation of the prostitute Fantine, the amorality of the rogue ThÃ©nardier, and the universal desire to escape the prisons of our own minds. Les MisÃ©rables gave Victor Hugo a canvas upon which he portrayed his criticism of the French political and judicial systems, but the portrait that resulted is larger than life, epic in scopeâ€”an extravagant spectacle that dazzles the senses e...', '33.jpg', 50, 1, 0),
(34, NULL, 22, 4, '9999999999999', 'Fahrenheit 451', '320.00', 2011, 0, 'Guy Montag is a fireman. In his world, where television rules and literature is on the brink of extinction, firemen start fires rather than put them out. His job is to destroy the most illegal of commodities, the printed book, along with the houses in which they are hidden.Montag never questions the destruction and ruin his actions produce, returning each day to his bland life and wife, Mildred, who spends all day with her television family. But then he meets an eccentric young neighbor, Clarisse, who introduces him to a past where people did not live in fear and to a present where one sees the world through the ideas in books instead of the mindless chatter of television.When Mildred attempts suicide and Clarisse suddenly disappears, Montag begins to question everything he has ever known.', '34.jpg', 25, 1, 0),
(35, NULL, 23, 2, '9780062024039', 'Divergent', '310.00', 2012, 0, 'In Beatrice Priors dystopian Chicago world, society is divided into five factions, each dedicated to the cultivation of a particular virtueâ€”Candor (the honest), Abnegation (the selfless), Dauntless (the brave), Amity (the peaceful), and Erudite (the intelligent). On an appointed day of every year, all sixteen-year-olds must select the faction to which they will devote the rest of their lives. For Beatrice, the decision is between staying with her family and being who she really isâ€”she cant have both. So she makes a choice that surprises everyone, including herself.During the highly competitive initiation that follows, Beatrice renames herself Tris and struggles alongside her fellow initiates to live out the choice they have made. Together they must undergo extreme physical tests of endurance and intense psychological simulations, some with devastating consequences. As initiation transforms them all, Tris must determine who her friends really areâ€”and where, exactly, a romance w...', '35.jpg', 23, 1, 0),
(36, NULL, 24, 2, '9780140283334', 'Lord of the Flies', '239.00', 1999, 0, 'At the dawn of the next world war, a plane crashes on an uncharted island, stranding a group of schoolboys. At first, with no adult supervision, their freedom is something to celebrate; this far from civilization the boys can do anything they want. Anything. They attempt to forge their own society, failing, however, in the face of terror, sin and evil. And as order collapses, as strange howls echo in the night, as terror begins its reign, the hope of adventure seems as far from reality as the hope of being rescued. Labeled a parable, an allegory, a myth, a morality tale, a parody, a political treatise, even a vision of the apocalypse, Lord of the Flies is perhaps our most memorable novel about â€œthe end of innocence, the darkness of manâ€™s heart.â€', '36.jpg', 23, 1, 0),
(37, NULL, 25, 2, '9780743477116', 'Romeo and Juliet', '732.00', 2004, 0, 'In Romeo and Juliet, Shakespeare creates a violent world, in which two young people fall in love. It is not simply that their families disapprove; the Montagues and the Capulets are engaged in a blood feud.In this death-filled setting, the movement from love at first sight to the loversâ€™ final union in death seems almost inevitable. And yet, this play set in an extraordinary world has become the quintessential story of young love. In part because of its exquisite language, it is easy to respond as if it were about all young lovers.', '37.jpg', 43, 1, 0),
(38, NULL, 26, 2, '9780062315007', 'The Alchemist', '632.00', 2014, 0, 'Paulo Coelhos enchanting novel has inspired a devoted following around the world. This story, dazzling in its powerful simplicity and soul-stirring wisdom, is about an Andalusian shepherd boy named Santiago who travels from his homeland in Spain to the Egyptian desert in search of a treasure buried near the Pyramids. Along the way he meets a Gypsy woman, a man who calls himself king, and an alchemist, all of whom point Santiago in the direction of his quest. No one knows what the treasure is, or if Santiago will be able to surmount the obstacles in his path. But what starts out as a journey to find worldly goods turns into a discovery of the treasure found within. Lush, evocative, and deeply humane, the story of Santiago is an eternal testament to the transforming power of our dreams and the importance of listening to our hearts.Illustration: Jim Tierney', '38.jpg', 32, 1, 0),
(39, NULL, 27, 2, '9780143058144', 'Crime and Punishment', '203.00', 2002, 0, 'Raskolnikov, a destitute and desperate former student, wanders through the slums of St Petersburg and commits a random murder without remorse or regret. He imagines himself to be a great man, a Napoleon: acting for a higher purpose beyond conventional moral law. But as he embarks on a dangerous game of cat and mouse with a suspicious police investigator, Raskolnikov is pursued by the growing voice of his conscience and finds the noose of his own guilt tightening around his neck. Only Sonya, a downtrodden prostitute, can offer the chance of redemption.', '39.jpg', 51, 1, 0),
(40, NULL, 28, 2, '9999999999999', 'The Perks of Being a Wallflower', '623.00', 1999, 0, 'standing on the fringes of life...offers a unique perspective. But there comes a time to seewhat it looks like from the dance floor.This haunting novel about the dilemma of passivity vs. passion marks the stunning debut of a provocative new voice in contemporary fiction: The Perks of Being A WALLFLOWERThis is the story of what its like to grow up in high school. More intimate than a diary, Charlies letters are singular and unique, hilarious and devastating. We may not know where he lives. We may not know to whom he is writing. All we know is the world he shares. Caught between trying to live his life and trying to run from it puts him on a strange course through uncharted territory. The world of first dates and mixed tapes, family dramas and new friends. The world of sex, drugs, and The Rocky Horror Picture Show, when all one requires is that the perfect song on that perfect drive to feel infinite.Through Charlie, Stephen Chbosky has created a deeply affecting coming-of-age story, a...', '40.jpg', 82, 1, 0),
(41, 2, 29, 2, '9999999999999', 'The Great Gatsby', '320.00', 2004, 0, 'Alternate Cover Edition ISBN: 0743273567 (ISBN13: 9780743273565)The Great Gatsby, F. Scott Fitzgeralds third book, stands as the supreme achievement of his career. This exemplary novel of the Jazz Age has been acclaimed by generations of readers. The story is of the fabulously wealthy Jay Gatsby and his new love for the beautiful Daisy Buchanan, of lavish parties on Long Island at a time when The New York Times noted &quot;gin was the national drink and sex the national obsession,&quot; it is an exquisitely crafted tale of America in the 1920s.The Great Gatsby is one of the great classics of twentieth-century literature.(back cover)', '41.jpg', 32, 1, 0),
(42, 2, 30, 1, '9781416914280', 'City of Bones', '120.00', 2007, 0, 'When fifteen-year-old Clary Fray heads out to the Pandemonium Club in New York City, she hardly expects to witness a murderâ€• much less a murder committed by three teenagers covered with strange tattoos and brandishing bizarre weapons. Then the body disappears into thin air. Its hard to call the police when the murderers are invisible to everyone else and when there is nothingâ€•not even a smear of bloodâ€•to show that a boy has died. Or was he a boy?This is Clarys first meeting with the Shadowhunters, warriors dedicated to ridding the earth of demons. Its also her first encounter with Jace, a Shadowhunter who looks a little like an angel and acts a lot like a jerk. Within twenty-four hours Clary is pulled into Jaces world with a vengeance when her mother disappears and Clary herself is attacked by a demon. But why would demons be interested in ordinary mundanes like Clary and her mother? And how did Clary suddenly get the Sight? The Shadowhunters would like to know...', '42.jpg', 24, 1, 0),
(43, 1, 31, 5, '9780812550702', 'Enders Game', '220.00', 2004, 0, 'Andrew &quot;Ender&quot; Wiggin thinks he is playing computer simulated war games; he is, in fact, engaged in something far more desperate. The result of genetic experimentation, Ender may be the military genius Earth desperately needs in a war against an alien enemy seeking to destroy all human life. The only way to find out is to throw Ender into ever harsher training, to chip away and find the diamond inside, or destroy him utterly. Ender Wiggin is six years old when it begins. He will grow up fast.But Ender is not the only result of the experiment. The war with the Buggers has been raging for a hundred years, and the quest for the perfect general has been underway almost as long. Enders two older siblings, Peter and Valentine, are every bit as unusual as he is, but in very different ways. While Peter was too uncontrollably violent, Valentine very nearly lacks the capability for violence altogether. Neither was found suitable for the militarys purpose. But they are driven by thei...', '43.jpg', 72, 1, 0),
(44, 3, 32, 1, '9999999999999', 'The Help', '820.00', 2009, 0, 'Librarians note: An alternate cover edition can be found hereThree ordinary women are about to take one extraordinary step.Twenty-two-year-old Skeeter has just returned home after graduating from Ole Miss. She may have a degree, but it is 1962, Mississippi, and her mother will not be happy till Skeeter has a ring on her finger. Skeeter would normally find solace with her beloved maid Constantine, the woman who raised her, but Constantine has disappeared and no one will tell Skeeter where she has gone.Aibileen is a black maid, a wise, regal woman raising her seventeenth white child. Something has shifted inside her after the loss of her own son, who died while his bosses looked the other way. She is devoted to the little girl she looks after, though she knows both their hearts may be broken.Minny, Aibileens best friend, is short, fat, and perhaps the sassiest woman in Mississippi. She can cook like nobodys business, but she cant mind her tongue, so shes lost yet another job. Minny fi...', '44.jpg', 62, 1, 0),
(45, 3, 33, 2, '9780451528827', 'Anne of Green Gables', '920.00', 2003, 0, 'As soon as Anne Shirley arrives at the snug white farmhouse called Green Gables, she is sure she wants to stay forever . . . but will the Cuthberts send her back to to the orphanage? Anne knows shes not what they expectedâ€”a skinny girl with fiery red hair and a temper to match. If only she can convince them to let her stay, shell try very hard not to keep rushing headlong into scrapes and blurting out the first thing that comes to her mind. Anne is not like anyone else, the Cuthberts agree; she is specialâ€”a girl with an enormous imagination. This orphan girl dreams of the day when she can call herself Anne of Green Gables.', '45.jpg', 7, 1, 0),
(46, 1, 34, 1, '9999999999999', 'Harry Potter and the Sorcerers Stone', '23.00', 2003, 0, 'Harry Potters life is miserable. His parents are dead and hes stuck with his heartless relatives, who force him to live in a tiny closet under the stairs. But his fortune changes when he receives a letter that tells him the truth about himself: hes a wizard. A mysterious visitor rescues him from his relatives and takes him to his new home, Hogwarts School of Witchcraft and Wizardry.After a lifetime of bottling up his magical powers, Harry finally feels like a normal kid. But even within the Wizarding community, he is special. He is the boy who lived: the only person to have ever survived a killing curse inflicted by the evil Lord Voldemort, who launched a brutal takeover of the Wizarding world, only to vanish after failing to kill Harry.Though Harrys first year at Hogwarts is the best of his life, not everything is perfect. There is a dangerous secret object hidden within the castle walls, and Harry believes its his responsibility to prevent it from falling into evil hands. But doin...', '46.jpg', 11, 1, 0),
(47, 2, 35, 2, '9999999999999', 'The Little Prince', '22.00', 2000, 0, 'A PBS Great American Read Top 100 PickFew stories are as widely read and as universally cherished by children and adults alike as The Little Prince. Richard Howards translation of the beloved classic beautifully reflects Saint-ExupÃ©rys unique and gifted style. Howard, an acclaimed poet and one of the preeminent translators of our time, has excelled in bringing the English text as close as possible to the French, in language, style, and most important, spirit. The artwork in this edition has been restored to match in detail and in color Saint-ExupÃ©rys original artwork. Combining Richard Howards translation with restored original art, this definitive English-language edition of The Little Prince will capture the hearts of readers of all ages.', '47.jpg', 33, 1, 0),
(48, 3, 36, 2, '9780064410939', 'Charlottes Web', '33.00', 2001, 0, 'This beloved book by E. B. White, author of Stuart Little and The Trumpet of the Swan, is a classic of childrens literature that is &quot;just about perfect.&quot; This high-quality paperback features vibrant illustrations colorized by Rosemary Wells!Some Pig. Humble. Radiant. These are the words in Charlottes Web, high up in Zuckermans barn. Charlottes spiderweb tells of her feelings for a little pig named Wilbur, who simply wants a friend. They also express the love of a girl named Fern, who saved Wilburs life when he was born the runt of his litter.E. B. Whites Newbery Honor Book is a tender novel of friendship, love, life, and death that will continue to be enjoyed by generations to come. This edition contains newly color illustrations by Garth Williams, the acclaimed illustrator of E. B. Whites Stuart Little and Laura Ingalls Wilders Little House series, among many other books.', '48.jpg', 22, 1, 0),
(49, 3, 24, 2, '9780142000670', 'Of Mice and Men', '22.00', 2002, 0, 'The compelling story of two outsiders striving to find their place in an unforgiving world. Drifters in search of work, George and his simple-minded friend Lennie have nothing in the world except each other and a dream -- a dream that one day they will have some land of their own. Eventually they find work on a ranch in Californiaâ€™s Salinas Valley, but their hopes are doomed as Lennie, struggling against extreme cruelty, misunderstanding and feelings of jealousy, becomes a victim of his own strength. Tackling universal themes such as the friendship of a shared vision, and giving voice to Americaâ€™s lonely and dispossessed, Of Mice and Men has proved one of Steinbeckâ€™s most popular works, achieving success as a novel, a Broadway play and three acclaimed films.', '49.jpg', 22, 1, 0),
(50, NULL, 37, 6, '9781939126016', 'The Time Travelers Wife', '22.00', 2013, 0, 'A funny, often poignant tale of boy meets girl with a twist: what if one of them couldnt stop slipping in and out of time? Highly original and imaginative, this debut novel raises questions about life, love, and the effects of time on relationships.Audrey Niffeneggerâ€™s innovative debut, The Time Travelerâ€™s Wife, is the story of Clare, a beautiful art student, and Henry, an adventuresome librarian, who have known each other since Clare was six and Henry was thirty-six, and were married when Clare was twenty-three and Henry thirty-one. Impossible but true, because Henry is one of the first people diagnosed with Chrono-Displacement Disorder: periodically his genetic clock resets and he finds himself misplaced in time, pulled to moments of emotional gravity in his life, past and future. His disappearances are spontaneous, his experiences unpredictable, alternately harrowing and amusing. The Time Travelerâ€™s Wife depicts the effects of time travel on Henry and Clareâ€™s marriage and...', '50.jpg', 22, 1, 0),
(51, NULL, 16, 2, '9780393970128', 'Dracula', '22.00', 1986, 0, 'You can find an alternative cover edition for this ISBN here and here.A rich selection of background and source materials is provided in three areas: Contexts includes probable inspirations for Dracula in the earlier works of James Malcolm Rymer and Emily Gerard. Also included are a discussion of Stokers working notes for the novel and &quot;Draculas Guest,&quot; the original opening chapter to Dracula. Reviews and Reactions reprints five early reviews of the novel. &quot;Dramatic and Film Variations&quot; focuses on theater and film adaptations of Dracula, two indications of the novels unwavering appeal. David J. Skal, Gregory A. Waller, and Nina Auerbach offer their varied perspectives. Checklists of both dramatic and film adaptations are included.Criticism collects seven theoretical interpretations of Dracula by Phyllis A. Roth, Carol A. Senf, Franco Moretti, Christopher Craft, Bram Dijkstra, Stephen D. Arata, and Talia Schaffer.A Chronology and a Selected Bibliography are included.', '51.jpg', 22, 1, 0),
(52, 2, 38, 2, '9780060929879', 'Brave New World', '11.00', 1998, 0, 'Brave New World is a dystopian novel by English author Aldous Huxley, written in 1931 and published in 1932. Largely set in a futuristic World State, inhabited by genetically modified citizens and an intelligence-based social hierarchy, the novel anticipates huge scientific advancements in reproductive technology, sleep-learning, psychological manipulation and classical conditioning that are combined to make a dystopian society which is challenged by only a single individual: the storys protagonist.', '52.jpg', 22, 1, 0),
(53, NULL, 39, 1, '9999999999999', 'One Hundred Years of Solitude', '22.00', 2003, 0, 'The brilliant, bestselling, landmark novel that tells the story of the Buendia family, and chronicles the irreconcilable conflict between the desire for solitude and the need for loveâ€”in rich, imaginative prose that has come to define an entire genre known as &quot;magical realism.&quot;', '53.jpg', 22, 1, 0),
(54, 1, 40, 2, '9780316769174', 'The Catcher in the Rye', '22.00', 2001, 0, 'The hero-narrator of The Catcher in the Rye is an ancient child of sixteen, a native New Yorker named Holden Caulfield. Through circumstances that tend to preclude adult, secondhand description, he leaves his prep school in Pennsylvania and goes underground in New York City for three days. The boy himself is at once too simple and too complex for us to make any final comment about him or his story. Perhaps the safest thing we can say about Holden is that he was born in the world not just strongly attracted to beauty but, almost, hopelessly impaled on it. There are many voices in this novel: childrens voices, adult voices, underground voices-but Holdens voice is the most eloquent of all. Transcending his own vernacular, yet remaining marvelously faithful to it, he issues a perfectly articulated cry of mixed pain and pleasure. However, like most lovers and clowns and poets of the higher orders, he keeps most of the pain to, and for, himself. The pleasure he gives away, or sets aside, ...', '54.jpg', 22, 1, 0),
(55, 3, 10, 2, '9780345418265', 'The Princess Bride', '22.00', 2003, 0, 'What happens when the most beautiful girl in the world marries the handsomest prince of all time and he turns out to be...well...a lot less than the man of her dreams?As a boy, William Goldman claims, he loved to hear his father read the S. Morgenstern classic, The Princess Bride. But as a grown-up he discovered that the boring parts were left out of good old Dads recitation, and only the &quot;good parts&quot; reached his ears.Now Goldman does Dad one better. Hes reconstructed the &quot;Good Parts Version&quot; to delight wise kids and wide-eyed grownups everywhere.Whats it about? Fencing. Fighting. True Love. Strong Hate. Harsh Revenge. A Few Giants. Lots of Bad Men. Lots of Good Men. Five or Six Beautiful Women. Beasties Monstrous and Gentle. Some Swell Escapes and Captures. Death, Lies, Truth, Miracles, and a Little Sex.In short, its about everything.', '55.jpg', 22, 1, 0),
(56, NULL, 41, 2, '9780786838653', 'The Lightning Thief', '22.00', 2006, 0, 'Alternate cover for this ISBN can be found herePercy Jackson is a good kid, but he cant seem to focus on his schoolwork or control his temper. And lately, being away at boarding school is only getting worse - Percy could have sworn his pre-algebra teacher turned into a monster and tried to kill him. When Percys mom finds out, she knows its time that he knew the truth about where he came from, and that he go to the one place hell be safe. She sends Percy to Camp Half Blood, a summer camp for demigods (on Long Island), where he learns that the father he never knew is Poseidon, God of the Sea. Soon a mystery unfolds and together with his friendsâ€”one a satyr and the other the demigod daughter of Athena - Percy sets out on a quest across the United States to reach the gates of the Underworld (located in a recording studio in Hollywood) and prevent a catastrophic war between the gods.', '56.jpg', 22, 1, 0),
(57, NULL, 42, 1, '9780517189603', 'The Secret Garden', '22.00', 1998, 0, '&quot;One of the most delightful and enduring classics of childrens literature, The Secret Garden by Victorian author Frances Hodgson Burnett has remained a firm favorite with children the world over ever since it made its first appearance. Initially published as a serial story in 1910 in The American Magazine, it was brought out in novel form in 1911.  The plot centers round Mary Lennox, a young English girl who returns to England from India, having suffered the immense trauma by losing both her parents in a cholera epidemic. However, her memories of her parents are not pleasant, as they were a selfish, neglectful and pleasure-seeking couple. Mary is given to the care of her uncle Archibald Craven, whom she has never met. She travels to his home, Misselthwaite Manor located in the gloomy Yorkshire, a vast change from the sunny and warm climate she was used to. When she arrives, she is a rude, stubborn and given to stormy temper tantrums. However, her nature undergoes a gradual tran...', '57.jpg', 22, 1, 0),
(58, NULL, 43, 1, '9781594489501', 'A Thousand Splendid Suns', '22.00', 2007, 0, 'A Thousand Splendid Suns is a breathtaking story set against the volatile events of Afghanistans last thirty yearsâ€”from the Soviet invasion to the reign of the Taliban to post-Taliban rebuildingâ€”that puts the violence, fear, hope, and faith of this country in intimate, human terms. It is a tale of two generations of characters brought jarringly together by the tragic sweep of war, where personal livesâ€”the struggle to survive, raise a family, find happinessâ€”are inextricable from the history playing out around them.Propelled by the same storytelling instinct that made The Kite Runner a beloved classic, A Thousand Splendid Suns is at once a remarkable chronicle of three decades of Afghan history and a deeply moving account of family and friendship. It is a striking, heart-wrenching novel of an unforgiving time, an unlikely friendship, and an indestructible loveâ€”a stunning accomplishment.--front flap', '58.jpg', 22, 1, 0),
(59, NULL, 44, 2, '9781250153272', 'A Wrinkle in Time', '22.00', 2017, 0, 'It was a dark and stormy night.Out of this wild night, a strange visitor comes to the Murry house and beckons Meg, her brother Charles Wallace, and their friend Calvin OKeefe on a most dangerous and extraordinary adventureâ€”one that will threaten their lives and our universe.Winner of the 1963 Newbery Medal, A Wrinkle in Time is the first book in Madeleine LEngles classic Time Quintet.', '59.jpg', 22, 1, 0),
(60, NULL, 45, 3, '9780553588484', 'A Game of Thrones', '22.00', 2005, 0, 'Here is the first volume in George R. R. Martinâ€™s magnificent cycle of novels that includes A Clash of Kings and A Storm of Swords. As a whole, this series comprises a genuine masterpiece of modern fantasy, bringing together the best the genre has to offer. Magic, mystery, intrigue, romance, and adventure fill these pages and transport us to a world unlike any we have ever experienced. Already hailed as a classic, George R. R. Martinâ€™s stunning series is destined to stand as one of the great achievements of imaginative fiction.A GAME OF THRONESLong ago, in a time forgotten, a preternatural event threw the seasons out of balance. In a land where summers can last decades and winters a lifetime, trouble is brewing. The cold is returning, and in the frozen wastes to the north of Winterfell, sinister and supernatural forces are massing beyond the kingdomâ€™s protective Wall. At the center of the conflict lie the Starks of Winterfell, a family as harsh and unyielding as the land they ...', '60.jpg', 22, 1, 0),
(61, NULL, 21, 2, '9780142437179', 'The Adventures of Huckleberry Finn', '22.00', 2002, 0, 'A nineteenth-century boy from a Mississippi River town recounts his adventures as he travels down the river with a runaway slave, encountering a family involved in a feud, two scoundrels pretending to be royalty, and Tom Sawyers aunt who mistakes him for Tom.', '61.jpg', 22, 1, 0),
(62, 1, 6, 3, '9780316166683', 'The Lovely Bones', '22.00', 2006, 0, '&quot;My name was Salmon, like the fish; first name, Susie. I was fourteen when I was murdered on December 6, 1973.&quot;So begins the story of Susie Salmon, who is adjusting to her new home in heaven, a place that is not at all what she expected, even as she is watching life on earth continue without her -- her friends trading rumors about her disappearance, her killer trying to cover his tracks, her grief-stricken family unraveling. Out of unspeakable tragedy and loss, The Lovely Bones succeeds, miraculously, in building a tale filled with hope, humor, suspense, even joy.', '62.jpg', 22, 1, 0),
(63, 2, 46, 3, '9999999999999', 'The Outsiders', '22.00', 1997, 0, 'The Outsiders is about two weeks in the life of a 14-year-old boy. The novel tells the story of Ponyboy Curtis and his struggles with right and wrong in a society in which he believes that he is an outsider. According to Ponyboy, there are two kinds of people in the world: greasers and socs. A soc (short for &quot;social&quot;) has money, can get away with just about anything, and has an attitude longer than a limousine. A greaser, on the other hand, always lives on the outside and needs to watch his back. Ponyboy is a greaser, and hes always been proud of it, even willing to rumble against a gang of socs for the sake of his fellow greasers--until one terrible night when his friend Johnny kills a soc. The murder gets under Ponyboys skin, causing his bifurcated world to crumble and teaching him that pain feels the same whether a soc or a greaser.Librarian note: This record is for one of the three editions published with different covers and with ISBN 0-140-38572-X / 978-0-14-038572-4...', '63.jpg', 22, 1, 0),
(64, NULL, 47, 2, '9780099408390', 'Where the Wild Things Are', '22.00', 2000, 0, 'Max, a wild and naughty boy, is sent to bed without his supper by his exhausted mother. In his room, he imagines sailing far away to a land of Wild Things. Instead of eating him, the Wild Things make Max their king.', '64.jpg', 22, 1, 0),
(65, 2, 48, 1, '9780394800165', 'Green Eggs and Ham', '22.00', 1988, 0, 'â€œDo you like green eggs and ham?â€ asks Sam-I-am in this Beginner Book by Dr. Seuss. In a house or with a mouse? In a boat or with a goat? On a train or in a tree? Sam keeps asking persistently. With unmistakable characters and signature rhymes, Dr. Seussâ€™s beloved favorite has cemented its place as a childrenâ€™s classic. In this most famous of cumulative tales, the list of places to enjoy green eggs and ham, and friends to enjoy them with, gets longer and longer. Follow Sam-I-am as he insists that this unusual treat is indeed a delectable snack to be savored everywhere and in every way. Originally created by Dr. Seuss, Beginner Books encourage children to read all by themselves, with simple words and illustrations that give clues to their meaning.', '65.jpg', 22, 1, 0),
(66, NULL, 21, 2, '9780143039952', 'The Odyssey', '22.00', 2006, 0, 'Sing to me of the man, Muse, the man of twists and turnsdriven time and again off course, once he had plunderedthe hallowed heights of Troy.So begins Robert Fagles magnificent translation of the Odyssey, which Jasper Griffin in The New York Times Review of Books hails as &quot;a distinguished achievement.&quot;If the Iliad is the worlds greatest war epic, then the Odyssey is literatures grandest evocation of everymans journey though life. Odysseus reliance on his wit and wiliness for survival in his encounters with divine and natural forces, during his ten-year voyage home to Ithaca after the Trojan War, is at once a timeless human story and an individual test of moral endurance. In the myths and legends that are retold here, Fagles has captured the energy and poetry of Homers original in a bold, contemporary idiom, and given us an Odyssey to read aloud, to savor, and to treasure for its sheer lyrical mastery.Renowned classicist Bernard Knoxs superb Introduction and textual commenta...', '66.jpg', 22, 1, 0),
(67, NULL, 49, 2, '9780770430078', 'Life of Pi', '22.00', 2006, 0, 'Life of Pi is a fantasy adventure novel by Yann Martel published in 2001. The protagonist, Piscine Molitor &quot;Pi&quot; Patel, a Tamil boy from Pondicherry, explores issues of spirituality and practicality from an early age. He survives 227 days after a shipwreck while stranded on a boat in the Pacific Ocean with a Bengal tiger named Richard Parker.', '67.jpg', 22, 1, 0),
(68, 3, 24, 2, '9780141439600', 'A Tale of Two Cities', '22.00', 2003, 0, 'After eighteen years as a political prisoner in the Bastille, the ageing Doctor Manette is finally released and reunited with his daughter in England. There the lives of two very different men, Charles Darnay, an exiled French aristocrat, and Sydney Carton, a disreputable but brilliant English lawyer, become enmeshed through their love for Lucie Manette. From the tranquil roads of London, they are drawn against their will to the vengeful, bloodstained streets of Paris at the height of the Reign of Terror, and they soon fall under the lethal shadow of La Guillotine.', '68.jpg', 22, 1, 0),
(69, 3, 50, 2, '9781565125605', 'Water for Elephants', '22.00', 2007, 0, 'Winner of the 2007 BookBrowse Award for Most Popular Book.An atmospheric, gritty, and compelling novel of star-crossed lovers, set in the circus world circa 1932, by the bestselling author of Riding Lessons. When Jacob Jankowski, recently orphaned and suddenly adrift, jumps onto a passing train, he enters a world of freaks, drifters, and misfits, a second-rate circus struggling to survive during the Great Depression, making one-night stands in town after endless town. A veterinary student who almost earned his degree, Jacob is put in charge of caring for the circus menagerie. It is there that he meets Marlena, the beautiful young star of the equestrian act, who is married to August, the charismatic but twisted animal trainer. He also meets Rosie, an elephant who seems untrainable until he discovers a way to reach her. Beautifully written, Water for Elephants is illuminated by a wonderful sense of time and place. It tells a story of a love between two people that overcomes incredible...', '69.jpg', 22, 1, 0),
(70, 2, 27, 2, '9999999999999', 'Lolita', '22.00', 1995, 0, 'Humbert Humbert - scholar, aesthete and romantic - has fallen completely and utterly in love with Lolita Haze, his landladys gum-snapping, silky skinned twelve-year-old daughter. Reluctantly agreeing to marry Mrs Haze just to be close to Lolita, Humbert suffers greatly in the pursuit of romance; but when Lo herself starts looking for attention elsewhere, he will carry her off on a desperate cross-country misadventure, all in the name of Love. Hilarious, flamboyant, heart-breaking and full of ingenious word play, Lolita is an immaculate, unforgettable masterpiece of obsession, delusion and lust.', '70.jpg', 22, 1, 0),
(71, NULL, 51, 2, '9780385333849', 'Slaughterhouse-Five', '22.00', 1999, 0, 'Selected by the Modern Library as one of the 100 best novels of all time, Slaughterhouse-Five, an American classic, is one of the worlds great antiwar books. Centering on the infamous firebombing of Dresden, Billy Pilgrims odyssey through time reflects the mythic journey of our own fractured lives as we search for meaning in what we fear most.', '71.jpg', 22, 1, 0);
INSERT INTO `books` (`book_ID`, `category_ID`, `publisher_ID`, `format_ID`, `ISBN`, `title`, `price`, `publication_year`, `popularity_score`, `description`, `cover_image_loc`, `stock_qty`, `is_for_training`, `is_deleted`) VALUES
(72, NULL, 21, 2, '9780143131847', 'Frankenstein: The 1818 Text', '22.00', 2018, 0, 'Mary Shelleys seminal novel of the scientist whose creation becomes a monsterThis edition is the original 1818 text, which preserves the hard-hitting and politically charged aspects of Shelleys original writing, as well as her unflinching wit and strong female voice. This edition also includes a new introduction and suggestions for further reading by author and Shelley expert Charlotte Gordon, literary excerpts and reviews selected by Gordon and a chronology and essay by preeminent Shelley scholar Charles E. Robinson.', '72.jpg', 22, 1, 0),
(73, NULL, 43, 2, '9999999999999', 'The Kite Runner', '22.00', 2004, 0, 'The unforgettable, heartbreaking story of the unlikely friendship between a wealthy boy and the son of his fatherâ€™s servant, The Kite Runner is a beautifully crafted novel set in a country that is in the process of being destroyed. It is about the power of reading, the price of betrayal, and the possibility of redemption; and an exploration of the power of fathers over sonsâ€”their love, their sacrifices, their lies.A sweeping story of family, love, and friendship told against the devastating backdrop of the history of Afghanistan over the last thirty years, The Kite Runner is an unusual and powerful novel that has become a beloved, one-of-a-kind classic.--khaledhosseini.com', '73.jpg', 26, 1, 0),
(74, NULL, 52, 2, '9999999999999', 'The Handmaids Tale', '22.00', 1998, 0, 'Offred is a Handmaid in the Republic of Gilead. She may leave the home of the Commander and his wife once a day to walk to food markets whose signs are now pictures instead of words because women are no longer allowed to read. She must lie on her back once a month and pray that the Commander makes her pregnant, because in an age of declining births, Offred and the other Handmaids are valued only if their ovaries are viable. Offred can remember the years before, when she lived and made love with her husband, Luke; when she played with and protected her daughter; when she had a job, money of her own, and access to knowledge. But all of that is gone now . . . Funny, unexpected, horrifying, and altogether convincing, The Handmaids Tale is at once scathing satire, dire warning, and tour de force.', '74.jpg', 22, 1, 0),
(75, NULL, 53, 2, '9780385732550', 'The Giver', '22.00', 2006, 0, 'Twelve-year-old Jonas lives in a seemingly ideal world. Not until he is given his life assignment as the Receiver does he begin to understand the dark secrets behind this fragile community.', '75.jpg', 22, 1, 0),
(76, NULL, 22, 2, '9780684833392', 'Catch-22', '22.00', 2004, 0, 'The novel is set during World War II, from 1942 to 1944. It mainly follows the life of Captain John Yossarian, a U.S. Army Air Forces B-25 bombardier. Most of the events in the book occur while the fictional 256th Squadron is based on the island of Pianosa, in the Mediterranean Sea, west of Italy. The novel looks into the experiences of Yossarian and the other airmen in the camp, who attempt to maintain their sanity while fulfilling their service requirements so that they may return home.', '76.jpg', 22, 1, 0),
(77, NULL, 54, 1, '9780593099322', 'Dune', '22.00', 2019, 0, 'Set on the desert planet Arrakis, Dune is the story of the boy Paul Atreides, heir to a noble family tasked with ruling an inhospitable world where the only thing of value is the â€œspiceâ€ melange, a drug capable of extending life and enhancing consciousness. Coveted across the known universe, melange is a prize worth killing for...When House Atreides is betrayed, the destruction of Paulâ€™s family will set the boy on a journey toward a destiny greater than he could ever have imagined. And as he evolves into the mysterious man known as Muadâ€™Dib, he will bring to fruition humankindâ€™s most ancient and unattainable dream.', '77.jpg', 22, 1, 0),
(78, NULL, 55, 2, '9999999999999', 'The Pillars of the Earth', '22.00', 2002, 0, 'Ken Follett is known worldwide as the master of split-second suspense, but his most beloved and bestselling book tells the magnificent tale of a twelfth-century monk driven to do the seemingly impossible: build the greatest Gothic cathedral the world has ever known.Everything readers expect from Follett is here: intrigue, fast-paced action, and passionate romance. But what makes The Pillars of the Earth extraordinary is the time the twelfth century; the place feudal England; and the subject the building of a glorious cathedral. Follett has re-created the crude, flamboyant England of the Middle Ages in every detail. The vast forests, the walled towns, the castles, and the monasteries become a familiar landscape. Against this richly imagined and intricately interwoven backdrop, filled with the ravages of war and the rhythms of daily life, the master storyteller draws the reader irresistibly into the intertwined lives of his characters into their dreams, their labors, and their loves: ...', '78.jpg', 22, 1, 0),
(79, NULL, 56, 1, '9780385199575', 'The Stand', '22.00', 1990, 0, 'This is the way the world ends: with a nanosecond of computer error in a Defense Department laboratory and a million casual contacts that form the links in a chain letter of death. And here is the bleak new world of the day after: a world stripped of its institutions and emptied of 99 percent of its people. A world in which a handful of panicky survivors choose sides -- or are chosen.', '79.jpg', 22, 1, 0),
(80, NULL, 57, 2, '9999999999999', 'The Adventures of Sherlock Holmes', '22.00', 1998, 0, 'The Adventures of Sherlock Holmes is the series of short stories that made the fortunes of the Strand magazine, in which they were first published, and won immense popularity for Sherlock Holmes and Dr Watson. The detective is at the height of his powers and the volume is full of famous cases, including The Red-Headed League, The Blue Carbuncle, and The Speckled Band. Although Holmes gained a reputation for infallibility, Conan Doyle showed his own realism and feminism by having the great detective defeated by Irene Adler - the woman - in the very first story, A Scandal in Bohemia. The editor of this volume, Richard Lancelyn Green is editor of The Uncollected Sherlock Holmes and The Further Adventures of Sherlock Holmes. With John Michael Gibson, he compiled the Soho Series Bibliography of A. Conan Doyle.', '80.jpg', 22, 1, 0),
(81, NULL, 58, 3, '9780380395866', 'Watership Down', '22.00', 1975, 0, 'Librarians note: See alternate cover edition of ISBN13 9780380395866 here.Set in Englands Downs, a once idyllic rural landscape, this stirring tale of adventure, courage and survival follows a band of very special creatures on their flight from the intrusion of man and the certain destruction of their home. Led by a stouthearted pair of friends, they journey forth from their native Sandleford Warren through the harrowing trials posed by predators and adversaries, to a mysterious promised land and a more perfect society.', '81.jpg', 22, 1, 0),
(82, NULL, 57, 2, '9780192833594', 'Great Expectations', '22.00', 1998, 0, 'In what may be Dickenss best novel, humble, orphaned Pip is apprenticed to the dirty work of the forge but dares to dream of becoming a gentleman â€” and one day, under sudden and enigmatic circumstances, he finds himself in possession of &quot;great expectations.&quot; In this gripping tale of crime and guilt, revenge and reward, the compelling characters include Magwitch, the fearful and fearsome convict; Estella, whose beauty is excelled only by her haughtiness; and the embittered Miss Havisham, an eccentric jilted bride', '82.jpg', 22, 1, 0),
(83, NULL, 8, 2, '9780451529305', 'Little Women', '22.00', 2004, 0, 'Generations of readers young and old, male and female, have fallen in love with the March sisters of Louisa May Alcottâ€™s most popular and enduring novel, Little Women. Here are talented tomboy and author-to-be Jo, tragically frail Beth, beautiful Meg, and romantic, spoiled Amy, united in their devotion to each other and their struggles to survive in New England during the Civil War.It is no secret that Alcott based Little Women on her own early life. While her father, the freethinking reformer and abolitionist Bronson Alcott, hobnobbed with such eminent male authors as Emerson, Thoreau, and Hawthorne, Louisa supported herself and her sisters with &quot;womanâ€™s work,â€ including sewing, doing laundry, and acting as a domestic servant. But she soon discovered she could make more money writing. Little Women brought her lasting fame and fortune, and far from being the &quot;girlâ€™s bookâ€ her publisher requested, it explores such timeless themes as love and death, war and peace, ...', '83.jpg', 22, 1, 0),
(84, NULL, 4, 2, '9999999999999', 'The Bell Jar', '22.00', 2006, 0, 'The Bell Jar chronicles the crack-up of Esther Greenwood: brilliant, beautiful, enormously talented, and successful, but slowly going underâ€”maybe for the last time. Sylvia Plath masterfully draws the reader into Esthers breakdown with such intensity that Esthers insanity becomes completely real and even rational, as probable and accessible an experience as going to the movies. Such deep penetration into the dark and harrowing corners of the psyche is an extraordinary accomplishment and has made The Bell Jar a haunting American classic.', '84.jpg', 22, 1, 0),
(85, NULL, 59, 1, '9780545010221', 'Harry Potter and the Deathly Hallows', '22.00', 2007, 0, 'Harry Potter is leaving Privet Drive for the last time. But as he climbs into the sidecar of Hagridâ€™s motorbike and they take to the skies, he knows Lord Voldemort and the Death Eaters will not be far behind.The protective charm that has kept him safe until now is broken. But the Dark Lord is breathing fear into everything he loves. And he knows he canâ€™t keep hiding.To stop Voldemort, Harry knows he must find the remaining Horcruxes and destroy them.He will have to face his enemy in one final battle.--jkrowling.com', '85.jpg', 22, 1, 0),
(86, NULL, 60, 3, '9999999999999', 'One Flew Over the Cuckoos Nest', '22.00', 1963, 0, 'Tyrannical Nurse Ratched rules her ward in an Oregon State mental hospital with a strict and unbending routine, unopposed by her patients, who remain cowed by mind-numbing medication and the threat of electric shock therapy. But her regime is disrupted by the arrival of McMurphy â€“ the swaggering, fun-loving trickster with a devilish grin who resolves to oppose her rules on behalf of his fellow inmates. His struggle is seen through the eyes of Chief Bromden, a seemingly mute half-Indian patient who understands McMurphys heroic attempt to do battle with the powers that keep them imprisoned. Ken Keseys extraordinary first novel is an exuberant, ribald and devastatingly honest portrayal of the boundaries between sanity and madness.', '86.jpg', 22, 1, 0),
(87, NULL, 61, 2, '9999999999999', 'Anna Karenina', '22.00', 1912, 0, 'Acclaimed by many as the worlds greatest novel, Anna Karenina provides a vast panorama of contemporary life in Russia and of humanity in general. In it Tolstoy uses his intense imaginative insight to create some of the most memorable characters in all of literature. Anna is a sophisticated woman who abandons her empty existence as the wife of Karenin and turns to Count Vronsky to fulfil her passionate nature - with tragic consequences. Levin is a reflection of Tolstoy himself, often expressing the authors own views and convictions.Throughout, Tolstoy points no moral, merely inviting us not to judge but to watch. As Rosemary Edmonds comments, He leaves the shifting patterns of the kaleidoscope to bring home the meaning of the brooding words following the title, Vengeance is mine, and I will repay.', '87.jpg', 22, 1, 0),
(88, NULL, 62, 3, '9780440242949', 'Outlander', '22.00', 2005, 0, 'The year is 1945. Claire Randall, a former combat nurse, is just back from the war and reunited with her husband on a second honeymoon when she walks through a standing stone in one of the ancient circles that dot the British Isles. Suddenly she is a Sassenachâ€”an â€œoutlanderâ€â€”in a Scotland torn by war and raiding border clans in the year of Our Lord...1743. Hurled back in time by forces she cannot understand, Claire is catapulted into the intrigues of lairds and spies that may threaten her life, and shatter her heart. For here James Fraser, a gallant young Scots warrior, shows her a love so absolute that Claire becomes a woman torn between fidelity and desireâ€”and between two vastly different men in two irreconcilable lives.', '88.jpg', 22, 1, 0),
(89, NULL, 63, 2, '9780743454537', 'My Sisters Keeper', '22.00', 2005, 0, 'Anna is not sick, but she might as well be. By age thirteen, she has undergone countless surgeries, transfusions, and shots so that her older sister, Kate, can somehow fight the leukemia that has plagued her since childhood. The product of preimplantation genetic diagnosis, Anna was conceived as a bone marrow match for Kateâ€”a life and a role that she has never challenged... until now. Like most teenagers, Anna is beginning to question who she truly is. But unlike most teenagers, she has always been defined in terms of her sisterâ€”and so Anna makes a decision that for most would be unthinkable, a decision that will tear her family apart and have perhaps fatal consequences for the sister she loves.A provocative novel that raises some important ethical issues, My Sisters Keeper is the story of one familys struggle for survival at all human costs and a stunning parable for all time.', '89.jpg', 22, 1, 0),
(90, NULL, 64, 2, '9780141301068', 'Matilda', '22.00', 1998, 0, 'Matilda is a little girl who is far too good to be true. At age five-and-a-half shes knocking off double-digit multiplication problems and blitz-reading Dickens. Even more remarkably, her classmates love her even though shes a super-nerd and the teachers pet. But everything is not perfect in Matildas world. For starters she has two of the most idiotic, self-centered parents who ever lived. Then theres the large, busty nightmare of a school principal, Miss (&quot;The&quot;) Trunchbull, a former hammer-throwing champion who flings children at will and is approximately as sympathetic as a bulldozer. Fortunately for Matilda, she has the inner resources to deal with such annoyances: astonishing intelligence, saintly patience, and an innate predilection for revenge.She warms up with some practical jokes aimed at her hapless parents, but the true test comes when she rallies in defense of her teacher, the sweet Miss Honey, against the diabolical Trunchbull. There is never any doubt that Mat...', '90.jpg', 22, 1, 0),
(91, NULL, 10, 3, '9780345015339', 'The Fellowship of the Ring', '22.00', 1973, 0, 'One Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkeness bind themIn ancient times the Rings of Power were crafted by the Elven-smiths, and Sauron, The Dark Lord, forged the One Ring, filling it with his own power so that he could rule all others. But the One Ring was taken from him, and though he sought it throughout Middle-earth, it remained lost to him. After many ages it fell into the hands of Bilbo Baggins, as told in The Hobbit.In a sleepy village in the Shire, young Frodo Baggins finds himself faced with an immense task, as his elderly cousin Bilbo entrusts the Ring to his care. Frodo must leave his home and make a perilous journey across Middle-earth to the Cracks of Doom, there to destroy the Ring and foil the Dark Lord in his evil purpose.', '91.jpg', 22, 1, 0),
(92, NULL, 65, 1, '9999999999999', 'The Girl with the Dragon Tattoo', '22.00', 2008, 0, 'Harriet Vanger, a scion of one of Swedenâ€™s wealthiest families disappeared over forty years ago. All these years later, her aged uncle continues to seek the truth. He hires Mikael Blomkvist, a crusading journalist recently trapped by a libel conviction, to investigate. He is aided by the pierced and tattooed punk prodigy Lisbeth Salander. Together they tap into a vein of unfathomable iniquity and astonishing corruption.An international publishing sensation, Stieg Larssonâ€™s The Girl with the Dragon Tattoo combines murder mystery, family saga, love story, and financial intrigue into one satisfyingly complex and entertainingly atmospheric novel.Alternate Cover Edition ISBN 0307269752 (ISBN13: 9780307269751)', '92.jpg', 22, 1, 0),
(93, NULL, 6, 6, '9780316323703', 'Rebecca', '22.00', 2013, 0, 'Last night I dreamt I went to Manderley again . . .The novel begins in Monte Carlo, where our heroine is swept off her feet by the dashing widower Maxim de Winter and his sudden proposal of marriage. Orphaned and working as a ladys maid, she can barely believe her luck. It is only when they arrive at his massive country estate that she realizes how large a shadow his late wife will cast over their lives--presenting her with a lingering evil that threatens to destroy their marriage from beyond the grave.', '93.jpg', 22, 1, 0),
(94, NULL, 66, 4, '9999999999999', '1984', '22.00', 2013, 0, 'Among the seminal texts of the 20th century, Nineteen Eighty-Four is a rare work that grows more haunting as its futuristic purgatory becomes more real. Published in 1949, the book offers political satirist George Orwells nightmarish vision of a totalitarian, bureaucratic world and one poor stiffs attempt to find individuality. The brilliance of the novel is Orwells prescience of modern lifeâ€”the ubiquity of television, the distortion of the languageâ€”and his ability to construct such a thorough version of hell. Required reading for students since it was published, it ranks among the most terrifying novels ever written.', '94.jpg', 22, 1, 1),
(95, NULL, 24, 2, '9780143135692', 'The Color Purple', '22.00', 2019, 0, 'Winner of the Pulitzer Prize and the National Book Award. Alice Walkers iconic modern classic is now a Penguin Book.A powerful cultural touchstone of modern American literature, The Color Purple depicts the lives of African American women in early twentieth-century rural Georgia. Separated as girls, sisters Celie and Nettie sustain their loyalty to and hope in each other across time, distance and silence. Through a series of letters spanning twenty years, first from Celie to God, then the sisters to each other despite the unknown, the novel draws readers into its rich and memorable portrayals of Celie, Nettie, Shug Avery and Sofia and their experience. The Color Purple broke the silence around domestic and sexual abuse, narrating the lives of women through their pain and struggle, companionship and growth, resilience and bravery. Deeply compassionate and beautifully imagined, Alice Walkers epic carries readers on a spirit-affirming journey towards redemption and love.', '95.jpg', 22, 1, 0),
(96, NULL, 14, 2, '9780061120077', 'A Tree Grows in Brooklyn', '22.00', 2006, 0, 'The beloved American classic about a young girls coming-of-age at the turn of the century, Betty Smiths A Tree Grows in Brooklyn is a poignant and moving tale filled with compassion and cruelty, laughter and heartache, crowded with life and people and incident. The story of young, sensitive, and idealistic Francie Nolan and her bittersweet formative years in the slums of Williamsburg has enchanted and inspired millions of readers for more than sixty years. By turns overwhelming, sublime, heartbreaking, and uplifting, the daily experiences of the unforgettable Nolans are raw with honesty and tenderly threaded with family connectedness -- in a work of literary art that brilliantly captures a unique time and place as well as incredibly rich moments of universal experience.', '96.jpg', 22, 1, 0),
(97, NULL, 67, 2, '9780393341768', 'A Clockwork Orange', '22.00', 2019, 1, 'In Anthony Burgesss influential nightmare vision of the future, criminals take over after dark. Teen gang leader Alex narrates in fantastically inventive slang that echoes the violent intensity of youth rebelling against society. Dazzling and transgressive, A Clockwork Orange is a frightening fable about good and evil and the meaning of human freedom. This edition includes the controversial last chapter not published in the first edition, and Burgessâ€™s introduction, â€œA Clockwork Orange Resucked.â€', '97.jpg', 22, 1, 0),
(98, NULL, 7, 1, '9780307265432', 'The Road', '22.00', 2006, 0, 'A searing, postapocalyptic novel destined to become Cormac McCarthyâ€™s masterpiece.A father and his son walk alone through burned America. Nothing moves in the ravaged landscape save the ash on the wind. It is cold enough to crack stones, and when the snow falls it is gray. The sky is dark. Their destination is the coast, although they donâ€™t know what, if anything, awaits them there. They have nothing; just a pistol to defend themselves against the lawless bands that stalk the road, the clothes they are wearing, a cart of scavenged foodâ€”and each other.The Road is the profoundly moving story of a journey. It boldly imagines a future in which no hope remains, but in which the father and his son, â€œeach the otherâ€™s world entire,â€ are sustained by love. Awesome in the totality of its vision, it is an unflinching meditation on the worst and the best that we are capable of: ultimate destructiveness, desperate tenacity, and the tenderness that keeps two people alive in the face o...', '98.jpg', 22, 1, 0),
(99, NULL, 68, 2, '9780374528379', 'The Brothers Karamazov', '22.00', 2002, 0, 'The Brothers Karamazov is a murder mystery, a courtroom drama, and an exploration of erotic rivalry in a series of triangular love affairs involving the â€œwicked and sentimentalâ€ Fyodor Pavlovich Karamazov and his three sonsâ€•the impulsive and sensual Dmitri; the coldly rational Ivan; and the healthy, red-cheeked young novice Alyosha. Through the gripping events of their story, Dostoevsky portrays the whole of Russian life, is social and spiritual striving, in what was both the golden age and a tragic turning point in Russian culture.This award-winning translation by Richard Pevear and Larissa Volokhonsky remains true to the verbalinventiveness of Dostoevskyâ€™s prose, preserving the multiple voices, the humor, and the surprising modernity of the original. It is an achievement worthy of Dostoevskyâ€™s last and greatest novel.', '99.jpg', 22, 1, 0),
(100, NULL, 69, 2, '9780007205233', 'Angelas Ashes', '22.00', 2005, 0, 'Imbued on every page with Frank McCourts astounding humor and compassion. This is a glorious book that bears all the marks of a classic.&quot;When I look back on my childhood I wonder how I managed to survive at all. It was, of course, a miserable childhood: the happy childhood is hardly worth your while. Worse than the ordinary miserable childhood is the miserable Irish childhood, and worse yet is the miserable Irish Catholic childhood.&quot; So begins the Pulitzer Prize winning memoir of Frank McCourt, born in Depression-era Brooklyn to recent Irish immigrants and raised in the slums of Limerick, Ireland. Franks mother, Angela, has no money to feed the children since Franks father, Malachy, rarely works, and when he does he drinks his wages. Yet Malachy-- exasperating, irresponsible and beguiling-- does nurture in Frank an appetite for the one thing he can provide: a story. Frank lives for his fathers tales of Cuchulain, who saved Ireland, and of the Angel on the Seventh Step, who...', '100.jpg', 22, 1, 0),
(101, NULL, 70, 2, '9781595141743', 'Vampire Academy', '22.00', 2007, 0, 'ONLY A TRUE BEST FRIEND CAN PROTECT YOU FROM YOUR IMMORTAL ENEMIES...Lissa Dragomir is a Moroi princess: a mortal vampire with a rare gift for harnessing the earths magic. She must be protected at all times from Strigoi; the fiercest vampires - the ones who never die. The powerful blend of human and vampire blood that flows through Rose Hathaway, Lissas best friend, makes her a dhampir. Rose is dedicated to a dangerous life of protecting Lissa from the Strigoi, who are hell-bent on making Lissa one of them.After two years of freedom, Rose and Lissa are caught and dragged back to St. Vladimirs Academy, a school for vampire royalty and their guardians-to-be, hidden in the deep forests of Montana. But inside the iron gates, life is even more fraught with danger... and the Strigoi are always close by.Rose and Lissa must navigate their dangerous world, confront the temptations of forbidden love, and never once let their guard down, lest the evil undead make Lissa one of them forever...', '101.jpg', 22, 1, 0),
(102, NULL, 71, 3, '9999999999999', 'Siddhartha', '22.00', 1981, 0, 'Herman Hesses classic novel has delighted, inspired, and influenced generations of readers, writers, and thinkers. In this story of a wealthy Indian Brahmin who casts off a life of privilege to seek spiritual fulfillment. Hesse synthesizes disparate philosophies--Eastern religions, Jungian archetypes, Western individualism--into a unique vision of life as expressed through one mans search for true meaning.', '102.jpg', 22, 1, 0),
(103, NULL, 4, 1, '9780060786502', 'The Poisonwood Bible', '22.00', 2005, 1, 'The Poisonwood Bible is a story told by the wife and four daughters of Nathan Price, a fierce, evangelical Baptist who takes his family and mission to the Belgian Congo in 1959. They carry with them everything they believe they will need from home, but soon find that all of it -- from garden seeds to Scripture -- is calamitously transformed on African soil. What follows is a suspenseful epic of one familys tragic undoing and remarkable reconstruction over the course of three decades in postcolonial Africa.', '103.jpg', 22, 1, 0),
(104, NULL, 72, 1, '9780679879244', 'The Golden Compass', '22.00', 1996, 0, 'Lyra is rushing to the cold, far North, where witch clans and armored bears rule. North, where the Gobblers take the children they steal--including her friend Roger. North, where her fearsome uncle Asriel is trying to build a bridge to a parallel world.Can one small girl make a difference in such great and terrible endeavors? This is Lyra: a savage, a schemer, a liar, and as fierce and true a champion as Roger or Asriel could want--but what Lyra doesnt know is that to help one of them will be to betray the other.', '104.jpg', 22, 1, 0),
(105, NULL, 24, 2, '9780142437230', 'Don Quixote', '22.00', 2003, 0, 'Don Quixote has become so entranced by reading chivalric romances that he determines to become a knight-errant himself. In the company of his faithful squire, Sancho Panza, his exploits blossom in all sorts of wonderful ways. While Quixotes fancy often leads him astrayâ€”he tilts at windmills, imagining them to be giantsâ€”Sancho acquires cunning and a certain sagacity. Sane madman and wise fool, they roam the world together, and together they have haunted readers imaginations for nearly four hundred years.With its experimental form and literary playfulness, Don Quixote has been generally recognized as the first modern novel. The book has been enormously influential on a host of writers, from Fielding and Sterne to Flaubert, Dickens, Melville, and Faulkner, who reread it once a year, &quot;just as some people read the Bible.&quot;', '105.jpg', 22, 1, 0),
(106, NULL, 73, 2, '9780452011878', 'Atlas Shrugged', '22.00', 1999, 0, 'This is the story of a man who said that he would stop the motor of the world and did. Was he a destroyer or the greatest of liberators?Why did he have to fight his battle, not against his enemies, but against those who needed him most, and his hardest battle against the woman he loved? What is the worldâ€™s motor â€” and the motive power of every man? You will know the answer to these questions when you discover the reason behind the baffling events that play havoc with the lives of the characters in this story. Tremendous in its scope, this novel presents an astounding panorama of human life â€” from the productive genius who becomes a worthless playboy â€” to the great steel industrialist who does not know that he is working for his own destruction â€” to the philosopher who becomes a pirate â€” to the composer who gives up his career on the night of his triumph â€” to the woman who runs a transcontinental railroad â€” to the lowest track worker in her Terminal tunnels. You must ...', '106.jpg', 22, 1, 0),
(107, NULL, 3, 3, '9780439655484', 'Harry Potter and the Prisoner of Azkaban', '22.00', 2004, 0, 'Harry Potters third year at Hogwarts is full of new dangers. A convicted murderer, Sirius Black, has broken out of Azkaban prison, and it seems hes after Harry. Now Hogwarts is being patrolled by the dementors, the Azkaban guards who are hunting Sirius. But Harry cant imagine that Sirius or, for that matter, the evil Lord Voldemort could be more frightening than the dementors themselves, who have the terrible power to fill anyone they come across with aching loneliness and despair. Meanwhile, life continues as usual at Hogwarts. A top-of-the-line broom takes Harrys success at Quidditch, the sport of the Wizarding world, to new heights. A cute fourth-year student catches his eye. And he becomes close with the new Defense of the Dark Arts teacher, who was a childhood friend of his father. Yet despite the relative safety of life at Hogwarts and the best efforts of the dementors, the threat of Sirius Black grows ever closer. But if Harry has learned anything from his education in wizard...', '107.jpg', 22, 1, 0),
(108, NULL, 29, 1, '9780684830490', 'The Old Man and the Sea', '22.00', 1996, 0, 'Librarians note: An alternate cover edition can be found hereThis short novel, already a modern classic, is the superbly told, tragic story of a Cuban fisherman in the Gulf Stream and the giant Marlin he kills and loses â€” specifically referred to in the citation accompanying the authors Nobel Prize for literature in 1954.', '108.jpg', 22, 1, 0),
(109, NULL, 74, 4, '9999999999999', 'The Notebook', '22.00', 2000, 0, 'Set amid the austere beauty of the North Carolina coast begins the story of Noah Calhoun, a rural Southerner recently returned from the Second World War. Noah is restoring a plantation home to its former glory, and he is haunted by images of the beautiful girl he met fourteen years earlier, a girl he loved like no other. Unable to find her, yet unwilling to forget the summer they spent together, Noah is content to live with only memories...until she unexpectedly returns to his town to see him once again.Like a puzzle within a puzzle, the story of Noah and Allie is just the beginning. As it unfolds, their tale miraculously becomes something different, with much higher stakes. The result is a deeply moving portrait of love itself, the tender moments and the fundamental changes that affect us all. It is a story of miracles and emotions that will stay with you forever.', '109.jpg', 22, 1, 0),
(110, NULL, 75, 1, '9780525467564', 'Winnie-the-Pooh', '22.00', 2001, 0, 'The adventures of Christopher Robin and his friends in which Pooh Bear uses a balloon to get honey, Piglet meets a Heffalump, and Eeyore has a birthday.', '110.jpg', 22, 1, 0),
(111, NULL, 76, 1, '9780385074070', 'The Complete Stories and Poems', '22.00', 1984, 0, 'This single volume brings together all of Poes stories and poems, and illuminates the diverse and multifaceted genius of one of the greatest and most influential figures in American literary history.', '111.jpg', 22, 1, 0),
(112, NULL, 10, 2, '9780345476876', 'Interview with the Vampire', '22.00', 2004, 0, 'This is the story of Louis, as told in his own words, of his journey through mortal and immortal life. Louis recounts how he became a vampire at the hands of the radiant and sinister Lestat and how he became indoctrinated, unwillingly, into the vampire way of life. His story ebbs and flows through the streets of New Orleans, defining crucial moments such as his discovery of the exquisite lost young child Claudia, wanting not to hurt but to comfort her with the last breaths of humanity he has inside. Yet, he makes Claudia a vampire, trapping her womanly passion, will, and intelligence inside the body of a small child. Louis and Claudia form a seemingly unbreakable alliance and even &quot;settle down&quot; for a while in the opulent French Quarter. Louis remembers Claudias struggle to understand herself and the hatred they both have for Lestat that sends them halfway across the world to seek others of their kind. Louis and Claudia are desperate to find somewhere they belong, to find o...', '112.jpg', 22, 1, 0),
(113, NULL, 77, 2, '9780552135399', 'A Prayer for Owen Meany', '22.00', 1990, 1, 'Eleven-year-old Owen Meany, playing in a Little League baseball game in Gravesend, New Hampshire, hits a foul ball and kills his best friends mother. Owen doesnt believe in accidents; he believes he is Gods instrument. What happens to Owen after that 1953 foul is both extraordinary and terrifying. At moments a comic, self-deluded victim, but in the end the principal, tragic actor in a divine plan, Owen Meany is the most heartbreaking hero John Irving has yet created.', '113.jpg', 22, 1, 0),
(114, 2, 21, 2, '9780142437247', 'Moby-Dick or, the Whale', '22.00', 2003, 0, '&quot;It is the horrible texture of a fabric that should be woven of ships cables and hawsers. A Polar wind blows through it, and birds of prey hover over it.&quot; So Melville wrote of his masterpiece, one of the greatest works of imagination in literary history. In part, Moby-Dick is the story of an eerily compelling madman pursuing an unholy war against a creature as vast and dangerous and unknowable as the sea itself. But more than just a novel of adventure, more than an encyclopaedia of whaling lore and legend, the book can be seen as part of its authors lifelong meditation on America. Written with wonderfully redemptive humour, Moby-Dick is also a profound inquiry into character, faith, and the nature of perception.This edition of Moby-Dick, which reproduces the definitive text of the novel, includes invaluable explanatory notes, along with maps, illustrations, and a glossary of nautical terms.', '114.jpg', 22, 1, 0);

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
(81, 27, 21),
(82, 27, 22),
(83, 27, 23),
(84, 27, 24),
(85, 27, 25),
(93, 16, 6),
(94, 20, 11),
(95, 20, 12),
(96, 20, 13),
(97, 28, 26),
(98, 29, 27),
(99, 30, 28),
(100, 30, 29),
(101, 31, 30),
(102, 31, 31),
(103, 31, 32),
(104, 32, 24),
(105, 32, 33),
(106, 32, 34),
(107, 33, 35),
(108, 33, 36),
(109, 33, 37),
(110, 34, 38),
(111, 35, 39),
(112, 36, 40),
(113, 37, 41),
(114, 37, 42),
(115, 37, 43),
(116, 37, 44),
(117, 38, 45),
(118, 38, 46),
(119, 38, 47),
(120, 39, 48),
(121, 39, 49),
(122, 40, 50),
(123, 41, 51),
(124, 42, 52),
(125, 43, 53),
(126, 43, 54),
(127, 43, 55),
(128, 44, 56),
(129, 45, 57),
(130, 46, 4),
(131, 46, 5),
(132, 47, 58),
(133, 47, 59),
(134, 47, 60),
(135, 47, 61),
(136, 48, 62),
(137, 48, 63),
(138, 48, 64),
(139, 49, 65),
(140, 50, 66),
(141, 51, 67),
(142, 51, 68),
(143, 51, 69),
(144, 52, 70),
(145, 53, 71),
(146, 53, 72),
(147, 54, 73),
(148, 55, 74),
(149, 56, 75),
(150, 57, 76),
(151, 58, 77),
(152, 59, 78),
(153, 60, 79),
(154, 61, 80),
(155, 61, 81),
(156, 61, 82),
(157, 61, 83),
(158, 62, 84),
(159, 63, 85),
(160, 64, 86),
(161, 65, 87),
(162, 66, 88),
(163, 66, 89),
(164, 66, 90),
(165, 67, 91),
(166, 68, 92),
(167, 68, 93),
(168, 69, 94),
(169, 70, 95),
(170, 70, 96),
(171, 71, 97),
(172, 72, 98),
(173, 72, 99),
(174, 73, 77),
(175, 73, 100),
(176, 74, 101),
(177, 75, 102),
(178, 76, 103),
(179, 77, 104),
(180, 78, 105),
(181, 79, 106),
(182, 79, 107),
(183, 80, 108),
(184, 81, 109),
(185, 82, 92),
(186, 82, 110),
(187, 82, 111),
(188, 83, 112),
(189, 84, 113),
(190, 85, 4),
(191, 86, 114),
(192, 87, 115),
(193, 87, 116),
(194, 87, 117),
(195, 87, 118),
(196, 87, 119),
(197, 88, 120),
(198, 89, 121),
(199, 90, 122),
(200, 90, 123),
(201, 91, 16),
(202, 92, 124),
(203, 92, 125),
(204, 93, 126),
(205, 94, 11),
(206, 95, 127),
(207, 96, 128),
(208, 97, 129),
(209, 98, 130),
(210, 99, 48),
(211, 99, 131),
(212, 99, 132),
(213, 100, 133),
(214, 101, 134),
(215, 102, 135),
(216, 102, 136),
(217, 103, 137),
(218, 104, 138),
(219, 105, 139),
(220, 105, 140),
(221, 105, 141),
(222, 106, 142),
(223, 106, 143),
(224, 107, 4),
(225, 107, 5),
(226, 108, 144),
(227, 109, 145),
(228, 110, 146),
(229, 110, 147),
(230, 111, 148),
(231, 112, 149),
(232, 113, 150),
(233, 114, 151),
(234, 114, 152),
(235, 114, 153),
(236, 114, 154);

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
(314, 27, 47),
(315, 27, 34),
(316, 27, 38),
(317, 27, 87),
(318, 27, 51),
(319, 27, 49),
(320, 27, 89),
(321, 27, 53),
(322, 27, 57),
(323, 27, 52),
(374, 16, 47),
(375, 16, 34),
(376, 16, 49),
(377, 16, 50),
(378, 16, 51),
(379, 16, 33),
(380, 16, 52),
(381, 16, 53),
(382, 16, 54),
(383, 16, 55),
(384, 20, 47),
(385, 20, 34),
(386, 20, 35),
(387, 20, 36),
(388, 20, 51),
(389, 20, 68),
(390, 20, 50),
(391, 20, 37),
(392, 20, 53),
(393, 20, 54),
(394, 28, 34),
(395, 28, 90),
(396, 28, 91),
(397, 28, 92),
(398, 28, 93),
(399, 28, 49),
(400, 28, 39),
(401, 28, 53),
(402, 28, 94),
(403, 28, 58),
(404, 29, 34),
(405, 29, 49),
(406, 29, 38),
(407, 29, 52),
(408, 29, 47),
(409, 29, 95),
(410, 29, 58),
(411, 29, 53),
(412, 29, 96),
(413, 29, 97),
(414, 30, 47),
(415, 30, 34),
(416, 30, 98),
(417, 30, 36),
(418, 30, 51),
(419, 30, 87),
(420, 30, 53),
(421, 30, 88),
(422, 30, 99),
(423, 30, 57),
(424, 31, 47),
(425, 31, 36),
(426, 31, 34),
(427, 31, 44),
(428, 31, 33),
(429, 31, 51),
(430, 31, 39),
(431, 31, 53),
(432, 31, 88),
(433, 31, 100),
(434, 32, 47),
(435, 32, 34),
(436, 32, 38),
(437, 32, 49),
(438, 32, 51),
(439, 32, 87),
(440, 32, 52),
(441, 32, 88),
(442, 32, 50),
(443, 32, 57),
(444, 33, 47),
(445, 33, 34),
(446, 33, 49),
(447, 33, 51),
(448, 33, 101),
(449, 33, 52),
(450, 33, 53),
(451, 33, 102),
(452, 33, 38),
(453, 33, 57),
(454, 34, 47),
(455, 34, 34),
(456, 34, 37),
(457, 34, 35),
(458, 34, 50),
(459, 34, 51),
(460, 34, 53),
(461, 34, 36),
(462, 34, 58),
(463, 34, 48),
(464, 35, 33),
(465, 35, 35),
(466, 35, 34),
(467, 35, 36),
(468, 35, 37),
(469, 35, 38),
(470, 35, 39),
(471, 35, 40),
(472, 35, 41),
(473, 35, 42),
(474, 36, 47),
(475, 36, 34),
(476, 36, 33),
(477, 36, 50),
(478, 36, 51),
(479, 36, 35),
(480, 36, 54),
(481, 36, 53),
(482, 36, 55),
(483, 36, 39),
(484, 37, 47),
(485, 37, 103),
(486, 37, 34),
(487, 37, 38),
(488, 37, 50),
(489, 37, 77),
(490, 37, 54),
(491, 37, 51),
(492, 37, 55),
(493, 37, 83),
(494, 38, 34),
(495, 38, 47),
(496, 38, 36),
(497, 38, 104),
(498, 38, 53),
(499, 38, 105),
(500, 38, 51),
(501, 38, 106),
(502, 38, 107),
(503, 38, 39),
(504, 39, 47),
(505, 39, 34),
(506, 39, 108),
(507, 39, 51),
(508, 39, 109),
(509, 39, 53),
(510, 39, 104),
(511, 39, 94),
(512, 39, 88),
(513, 39, 50),
(514, 40, 33),
(515, 40, 34),
(516, 40, 74),
(517, 40, 76),
(518, 40, 38),
(519, 40, 75),
(520, 40, 99),
(521, 40, 47),
(522, 40, 110),
(523, 40, 40),
(524, 41, 47),
(525, 41, 34),
(526, 41, 50),
(527, 41, 51),
(528, 41, 49),
(529, 41, 38),
(530, 41, 53),
(531, 41, 54),
(532, 41, 55),
(533, 41, 111),
(534, 42, 36),
(535, 42, 33),
(536, 42, 60),
(537, 42, 38),
(538, 42, 63),
(539, 42, 34),
(540, 42, 59),
(541, 42, 62),
(542, 42, 112),
(543, 42, 43),
(544, 43, 37),
(545, 43, 34),
(546, 43, 33),
(547, 43, 36),
(548, 43, 47),
(549, 43, 48),
(550, 43, 35),
(551, 43, 64),
(552, 43, 45),
(553, 43, 39),
(554, 44, 34),
(555, 44, 49),
(556, 44, 52),
(557, 44, 58),
(558, 44, 97),
(559, 44, 74),
(560, 44, 45),
(561, 44, 47),
(562, 44, 113),
(563, 44, 114),
(564, 45, 47),
(565, 45, 34),
(566, 45, 33),
(567, 45, 44),
(568, 45, 49),
(569, 45, 46),
(570, 45, 52),
(571, 45, 45),
(572, 45, 115),
(573, 45, 76),
(574, 46, 36),
(575, 46, 34),
(576, 46, 33),
(577, 46, 43),
(578, 46, 44),
(579, 46, 46),
(580, 46, 39),
(581, 46, 47),
(582, 46, 45),
(583, 46, 48),
(584, 47, 47),
(585, 47, 34),
(586, 47, 36),
(587, 47, 44),
(588, 47, 101),
(589, 47, 33),
(590, 47, 104),
(591, 47, 51),
(592, 47, 102),
(593, 47, 46),
(594, 48, 47),
(595, 48, 44),
(596, 48, 34),
(597, 48, 33),
(598, 48, 36),
(599, 48, 116),
(600, 48, 46),
(601, 48, 117),
(602, 48, 50),
(603, 48, 118),
(604, 49, 47),
(605, 49, 34),
(606, 49, 50),
(607, 49, 49),
(608, 49, 51),
(609, 49, 54),
(610, 49, 53),
(611, 49, 55),
(612, 49, 111),
(613, 49, 57),
(614, 50, 34),
(615, 50, 38),
(616, 50, 36),
(617, 50, 119),
(618, 50, 37),
(619, 50, 74),
(620, 50, 58),
(621, 50, 113),
(622, 50, 97),
(623, 50, 120),
(624, 51, 47),
(625, 51, 98),
(626, 51, 34),
(627, 51, 36),
(628, 51, 59),
(629, 51, 87),
(630, 51, 60),
(631, 51, 51),
(632, 51, 45),
(633, 51, 62),
(634, 52, 47),
(635, 52, 34),
(636, 52, 37),
(637, 52, 35),
(638, 52, 51),
(639, 52, 53),
(640, 52, 50),
(641, 52, 36),
(642, 52, 104),
(643, 52, 48),
(644, 53, 34),
(645, 53, 47),
(646, 53, 120),
(647, 53, 51),
(648, 53, 53),
(649, 53, 36),
(650, 53, 49),
(651, 53, 121),
(652, 53, 122),
(653, 53, 123),
(654, 54, 47),
(655, 54, 34),
(656, 54, 33),
(657, 54, 51),
(658, 54, 50),
(659, 54, 53),
(660, 54, 76),
(661, 54, 111),
(662, 54, 55),
(663, 54, 54),
(664, 55, 36),
(665, 55, 34),
(666, 55, 47),
(667, 55, 38),
(668, 55, 79),
(669, 55, 33),
(670, 55, 39),
(671, 55, 48),
(672, 55, 80),
(673, 55, 124),
(674, 56, 36),
(675, 56, 33),
(676, 56, 125),
(677, 56, 34),
(678, 56, 46),
(679, 56, 39),
(680, 56, 44),
(681, 56, 63),
(682, 56, 126),
(683, 56, 43),
(684, 57, 47),
(685, 57, 34),
(686, 57, 44),
(687, 57, 33),
(688, 57, 49),
(689, 57, 46),
(690, 57, 51),
(691, 57, 36),
(692, 57, 52),
(693, 57, 45),
(694, 58, 34),
(695, 58, 49),
(696, 58, 74),
(697, 58, 53),
(698, 58, 52),
(699, 58, 64),
(700, 58, 97),
(701, 58, 58),
(702, 58, 77),
(703, 58, 51),
(704, 59, 36),
(705, 59, 34),
(706, 59, 47),
(707, 59, 33),
(708, 59, 37),
(709, 59, 44),
(710, 59, 46),
(711, 59, 119),
(712, 59, 39),
(713, 59, 48),
(714, 60, 36),
(715, 60, 34),
(716, 60, 71),
(717, 60, 58),
(718, 60, 48),
(719, 60, 72),
(720, 60, 39),
(721, 60, 127),
(722, 60, 45),
(723, 60, 128),
(724, 61, 47),
(725, 61, 34),
(726, 61, 49),
(727, 61, 51),
(728, 61, 33),
(729, 61, 39),
(730, 61, 50),
(731, 61, 53),
(732, 61, 54),
(733, 61, 111),
(734, 62, 34),
(735, 62, 90),
(736, 62, 33),
(737, 62, 74),
(738, 62, 36),
(739, 62, 94),
(740, 62, 58),
(741, 62, 97),
(742, 62, 77),
(743, 62, 53),
(744, 63, 47),
(745, 63, 33),
(746, 63, 34),
(747, 63, 50),
(748, 63, 75),
(749, 63, 54),
(750, 63, 76),
(751, 63, 49),
(752, 63, 74),
(753, 63, 40),
(754, 64, 44),
(755, 64, 82),
(756, 64, 34),
(757, 64, 47),
(758, 64, 36),
(759, 64, 39),
(760, 64, 33),
(761, 64, 116),
(762, 64, 85),
(763, 64, 129),
(764, 65, 44),
(765, 65, 82),
(766, 65, 47),
(767, 65, 34),
(768, 65, 83),
(769, 65, 36),
(770, 65, 79),
(771, 65, 85),
(772, 65, 130),
(773, 65, 33),
(774, 66, 47),
(775, 66, 34),
(776, 66, 83),
(777, 66, 125),
(778, 66, 36),
(779, 66, 50),
(780, 66, 51),
(781, 66, 39),
(782, 66, 54),
(783, 66, 49),
(784, 67, 34),
(785, 67, 36),
(786, 67, 47),
(787, 67, 39),
(788, 67, 74),
(789, 67, 53),
(790, 67, 51),
(791, 67, 120),
(792, 67, 131),
(793, 67, 104),
(794, 68, 47),
(795, 68, 34),
(796, 68, 49),
(797, 68, 51),
(798, 68, 52),
(799, 68, 53),
(800, 68, 50),
(801, 68, 57),
(802, 68, 88),
(803, 68, 100),
(804, 69, 34),
(805, 69, 49),
(806, 69, 38),
(807, 69, 52),
(808, 69, 58),
(809, 69, 97),
(810, 69, 74),
(811, 69, 114),
(812, 69, 53),
(813, 69, 116),
(814, 70, 47),
(815, 70, 34),
(816, 70, 51),
(817, 70, 53),
(818, 70, 108),
(819, 70, 38),
(820, 70, 109),
(821, 70, 122),
(822, 70, 132),
(823, 70, 58),
(824, 71, 47),
(825, 71, 34),
(826, 71, 37),
(827, 71, 64),
(828, 71, 49),
(829, 71, 51),
(830, 71, 53),
(831, 71, 119),
(832, 71, 111),
(833, 71, 36),
(834, 72, 47),
(835, 72, 34),
(836, 72, 98),
(837, 72, 37),
(838, 72, 87),
(839, 72, 36),
(840, 72, 50),
(841, 72, 51),
(842, 72, 53),
(843, 72, 88),
(844, 73, 34),
(845, 73, 49),
(846, 73, 74),
(847, 73, 47),
(848, 73, 53),
(849, 73, 52),
(850, 73, 51),
(851, 73, 58),
(852, 73, 97),
(853, 73, 77),
(854, 74, 34),
(855, 74, 47),
(856, 74, 35),
(857, 74, 37),
(858, 74, 133),
(859, 74, 36),
(860, 74, 58),
(861, 74, 45),
(862, 74, 51),
(863, 74, 53),
(864, 75, 33),
(865, 75, 34),
(866, 75, 47),
(867, 75, 35),
(868, 75, 37),
(869, 75, 36),
(870, 75, 50),
(871, 75, 44),
(872, 75, 46),
(873, 75, 54),
(874, 76, 47),
(875, 76, 34),
(876, 76, 64),
(877, 76, 49),
(878, 76, 79),
(879, 76, 51),
(880, 76, 53),
(881, 76, 134),
(882, 76, 111),
(883, 76, 52),
(884, 77, 37),
(885, 77, 34),
(886, 77, 36),
(887, 77, 47),
(888, 77, 48),
(889, 77, 135),
(890, 77, 45),
(891, 77, 53),
(892, 77, 39),
(893, 77, 58),
(894, 78, 49),
(895, 78, 34),
(896, 78, 52),
(897, 78, 36),
(898, 78, 47),
(899, 78, 136),
(900, 78, 45),
(901, 78, 100),
(902, 78, 53),
(903, 78, 58),
(904, 79, 98),
(905, 79, 34),
(906, 79, 36),
(907, 79, 37),
(908, 79, 41),
(909, 79, 91),
(910, 79, 35),
(911, 79, 137),
(912, 79, 45),
(913, 79, 47),
(914, 80, 47),
(915, 80, 90),
(916, 80, 34),
(917, 80, 86),
(918, 80, 94),
(919, 80, 138),
(920, 80, 51),
(921, 80, 93),
(922, 80, 39),
(923, 80, 45),
(924, 81, 47),
(925, 81, 34),
(926, 81, 36),
(927, 81, 33),
(928, 81, 116),
(929, 81, 44),
(930, 81, 39),
(931, 81, 51),
(932, 81, 53),
(933, 81, 45),
(934, 82, 47),
(935, 82, 34),
(936, 82, 51),
(937, 82, 49),
(938, 82, 50),
(939, 82, 53),
(940, 82, 88),
(941, 82, 57),
(942, 82, 100),
(943, 82, 139),
(944, 83, 47),
(945, 83, 34),
(946, 83, 49),
(947, 83, 33),
(948, 83, 38),
(949, 83, 52),
(950, 83, 51),
(951, 83, 44),
(952, 83, 57),
(953, 83, 53),
(954, 84, 47),
(955, 84, 34),
(956, 84, 133),
(957, 84, 110),
(958, 84, 140),
(959, 84, 141),
(960, 84, 51),
(961, 84, 53),
(962, 84, 83),
(963, 84, 58),
(964, 85, 36),
(965, 85, 33),
(966, 85, 34),
(967, 85, 43),
(968, 85, 44),
(969, 85, 39),
(970, 85, 45),
(971, 85, 46),
(972, 85, 47),
(973, 85, 48),
(974, 86, 47),
(975, 86, 34),
(976, 86, 51),
(977, 86, 140),
(978, 86, 53),
(979, 86, 50),
(980, 86, 110),
(981, 86, 111),
(982, 86, 141),
(983, 86, 74),
(984, 87, 47),
(985, 87, 34),
(986, 87, 38),
(987, 87, 108),
(988, 87, 49),
(989, 87, 51),
(990, 87, 109),
(991, 87, 53),
(992, 87, 88),
(993, 87, 57),
(994, 88, 49),
(995, 88, 38),
(996, 88, 36),
(997, 88, 34),
(998, 88, 119),
(999, 88, 52),
(1000, 88, 56),
(1001, 88, 58),
(1002, 88, 45),
(1003, 88, 142),
(1004, 89, 34),
(1005, 89, 74),
(1006, 89, 113),
(1007, 89, 33),
(1008, 89, 77),
(1009, 89, 58),
(1010, 89, 97),
(1011, 89, 75),
(1012, 89, 143),
(1013, 89, 53),
(1014, 90, 44),
(1015, 90, 34),
(1016, 90, 47),
(1017, 90, 36),
(1018, 90, 33),
(1019, 90, 46),
(1020, 90, 79),
(1021, 90, 45),
(1022, 90, 43),
(1023, 90, 84),
(1024, 91, 47),
(1025, 91, 39),
(1026, 91, 48),
(1027, 91, 72),
(1028, 91, 71),
(1029, 91, 33),
(1030, 91, 53),
(1031, 91, 43),
(1032, 91, 51),
(1033, 91, 45),
(1034, 92, 34),
(1035, 92, 90),
(1036, 92, 92),
(1037, 92, 74),
(1038, 92, 58),
(1039, 92, 97),
(1040, 92, 144),
(1041, 92, 91),
(1042, 92, 45),
(1043, 92, 94),
(1044, 93, 47),
(1045, 93, 34),
(1046, 93, 90),
(1047, 93, 38),
(1048, 93, 87),
(1049, 93, 49),
(1050, 93, 91),
(1051, 93, 92),
(1052, 93, 93),
(1053, 93, 58),
(1054, 94, 47),
(1055, 94, 34),
(1056, 94, 37),
(1057, 94, 35),
(1058, 94, 51),
(1059, 94, 53),
(1060, 94, 68),
(1061, 94, 50),
(1062, 94, 36),
(1063, 94, 58),
(1064, 95, 47),
(1065, 95, 34),
(1066, 95, 49),
(1067, 95, 133),
(1068, 95, 52),
(1069, 95, 99),
(1070, 95, 145),
(1071, 95, 51),
(1072, 95, 53),
(1073, 95, 58),
(1074, 96, 47),
(1075, 96, 34),
(1076, 96, 49),
(1077, 96, 33),
(1078, 96, 76),
(1079, 96, 52),
(1080, 96, 51),
(1081, 96, 146),
(1082, 96, 53),
(1083, 96, 114),
(1084, 97, 47),
(1085, 97, 34),
(1086, 97, 37),
(1087, 97, 35),
(1088, 97, 51),
(1089, 97, 53),
(1090, 97, 98),
(1091, 97, 91),
(1092, 97, 94),
(1093, 97, 147),
(1094, 98, 34),
(1095, 98, 37),
(1096, 98, 35),
(1097, 98, 41),
(1098, 98, 47),
(1099, 98, 98),
(1100, 98, 51),
(1101, 98, 53),
(1102, 98, 137),
(1103, 98, 74),
(1104, 99, 47),
(1105, 99, 34),
(1106, 99, 108),
(1107, 99, 51),
(1108, 99, 109),
(1109, 99, 104),
(1110, 99, 53),
(1111, 99, 88),
(1112, 99, 57),
(1113, 99, 148),
(1114, 100, 149),
(1115, 100, 150),
(1116, 100, 151),
(1117, 100, 47),
(1118, 100, 152),
(1119, 100, 153),
(1120, 100, 154),
(1121, 100, 155),
(1122, 100, 156),
(1123, 100, 52),
(1124, 101, 33),
(1125, 101, 36),
(1126, 101, 59),
(1127, 101, 60),
(1128, 101, 38),
(1129, 101, 63),
(1130, 101, 34),
(1131, 101, 62),
(1132, 101, 61),
(1133, 101, 43),
(1134, 102, 47),
(1135, 102, 34),
(1136, 102, 104),
(1137, 102, 148),
(1138, 102, 105),
(1139, 102, 51),
(1140, 102, 157),
(1141, 102, 158),
(1142, 102, 53),
(1143, 102, 49),
(1144, 103, 34),
(1145, 103, 49),
(1146, 103, 159),
(1147, 103, 47),
(1148, 103, 52),
(1149, 103, 122),
(1150, 103, 51),
(1151, 103, 53),
(1152, 103, 148),
(1153, 103, 97),
(1154, 104, 36),
(1155, 104, 33),
(1156, 104, 34),
(1157, 104, 44),
(1158, 104, 39),
(1159, 104, 37),
(1160, 104, 48),
(1161, 104, 160),
(1162, 104, 46),
(1163, 104, 45),
(1164, 105, 47),
(1165, 105, 34),
(1166, 105, 51),
(1167, 105, 121),
(1168, 105, 39),
(1169, 105, 53),
(1170, 105, 49),
(1171, 105, 161),
(1172, 105, 79),
(1173, 105, 57),
(1174, 106, 47),
(1175, 106, 104),
(1176, 106, 51),
(1177, 106, 68),
(1178, 106, 37),
(1179, 106, 35),
(1180, 106, 162),
(1181, 106, 53),
(1182, 106, 45),
(1183, 106, 34),
(1184, 107, 36),
(1185, 107, 33),
(1186, 107, 34),
(1187, 107, 43),
(1188, 107, 44),
(1189, 107, 39),
(1190, 107, 46),
(1191, 107, 45),
(1192, 107, 47),
(1193, 107, 48),
(1194, 108, 47),
(1195, 108, 34),
(1196, 108, 51),
(1197, 108, 53),
(1198, 108, 111),
(1199, 108, 50),
(1200, 108, 39),
(1201, 108, 57),
(1202, 108, 122),
(1203, 108, 132),
(1204, 109, 38),
(1205, 109, 34),
(1206, 109, 113),
(1207, 109, 74),
(1208, 109, 58),
(1209, 109, 97),
(1210, 109, 163),
(1211, 109, 78),
(1212, 109, 77),
(1213, 109, 47),
(1214, 110, 47),
(1215, 110, 44),
(1216, 110, 34),
(1217, 110, 36),
(1218, 110, 116),
(1219, 110, 82),
(1220, 110, 33),
(1221, 110, 45),
(1222, 110, 46),
(1223, 110, 84),
(1224, 111, 47),
(1225, 111, 83),
(1226, 111, 98),
(1227, 111, 34),
(1228, 111, 86),
(1229, 111, 90),
(1230, 111, 87),
(1231, 111, 51),
(1232, 111, 36),
(1233, 111, 57),
(1234, 112, 98),
(1235, 112, 36),
(1236, 112, 34),
(1237, 112, 59),
(1238, 112, 60),
(1239, 112, 62),
(1240, 112, 47),
(1241, 112, 87),
(1242, 112, 63),
(1243, 112, 49),
(1244, 113, 34),
(1245, 113, 47),
(1246, 113, 74),
(1247, 113, 51),
(1248, 113, 122),
(1249, 113, 53),
(1250, 113, 49),
(1251, 113, 97),
(1252, 113, 76),
(1253, 113, 111),
(1254, 114, 47),
(1255, 114, 34),
(1256, 114, 51),
(1257, 114, 39),
(1258, 114, 53),
(1259, 114, 49),
(1260, 114, 111),
(1261, 114, 57),
(1262, 114, 88),
(1263, 114, 134);

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
(3, 'New Releases'),
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

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_ID`, `user_ID`, `book_ID`, `event_type_ID`, `datetime_occurred`, `is_deleted`) VALUES
(1, 14, 97, 1, '2022-12-23 00:00:00', 0),
(2, 14, 60, 1, '2022-12-23 18:29:13', 0),
(3, 14, 97, 1, '2022-12-24 12:11:17', 0),
(4, 14, 97, 1, '2022-12-24 12:53:35', 0),
(5, 14, 60, 1, '2022-12-24 12:54:59', 0),
(6, 14, 60, 1, '2022-12-24 12:55:03', 0),
(7, 14, 97, 1, '2022-12-24 12:56:22', 0),
(8, 14, 113, 1, '2022-12-24 13:08:42', 0),
(9, 14, 103, 1, '2022-12-24 13:08:49', 0);

-- --------------------------------------------------------

--
-- Table structure for table `event_types`
--

CREATE TABLE `event_types` (
  `event_type_ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `weight` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_types`
--

INSERT INTO `event_types` (`event_type_ID`, `name`, `weight`) VALUES
(1, 'Click', 1),
(2, 'RecommendationClick', 1),
(3, 'AddToCart', 2),
(4, 'Purchase', 3);

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
(5, 'Audiobook'),
(6, 'ebook'),
(1, 'Hardcover'),
(4, 'Kindle Edition'),
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
(89, '18th Century'),
(88, '19th Century'),
(132, '20th Century'),
(42, 'Action'),
(58, 'Adult'),
(97, 'Adult Fiction'),
(39, 'Adventure'),
(159, 'Africa'),
(145, 'African American'),
(111, 'American'),
(112, 'Angels'),
(116, 'Animals'),
(137, 'Apocalyptic'),
(96, 'Asia'),
(45, 'Audiobook'),
(153, 'Autobiography'),
(151, 'Biography'),
(154, 'Biography Memoir'),
(114, 'Book Club'),
(67, 'Books About Books'),
(100, 'British Literature'),
(157, 'Buddhism'),
(115, 'Canada'),
(118, 'Chapter Books'),
(113, 'Chick Lit'),
(44, 'Childrens'),
(69, 'Christian'),
(70, 'Christian Fiction'),
(73, 'Civil War'),
(57, 'Classic Literature'),
(47, 'Classics'),
(80, 'Comedy'),
(76, 'Coming of Age'),
(74, 'Contemporary'),
(163, 'Contemporary Romance'),
(94, 'Crime'),
(138, 'Detective'),
(127, 'Dragons'),
(77, 'Drama'),
(35, 'Dystopia'),
(162, 'Economics'),
(128, 'Epic'),
(71, 'Epic Fantasy'),
(124, 'Fairy Tales'),
(143, 'Family'),
(36, 'Fantasy'),
(133, 'Feminism'),
(34, 'Fiction'),
(81, 'Filler'),
(130, 'Food'),
(101, 'France'),
(102, 'French Literature'),
(158, 'German Literature'),
(87, 'Gothic'),
(126, 'Greek Mythology'),
(72, 'High Fantasy'),
(55, 'High School'),
(52, 'Historical'),
(49, 'Historical Fiction'),
(56, 'Historical Romance'),
(155, 'History'),
(65, 'Holocaust'),
(98, 'Horror'),
(79, 'Humor'),
(131, 'India'),
(107, 'Inspirational'),
(152, 'Ireland'),
(156, 'Irish Literature'),
(95, 'Japan'),
(84, 'Juvenile'),
(117, 'Juvenille'),
(85, 'Kids'),
(123, 'Latin American'),
(99, 'LGBT'),
(122, 'Literary Fiction'),
(51, 'Literature'),
(78, 'Love'),
(43, 'Magic'),
(120, 'Magical Realism'),
(136, 'Medieval'),
(150, 'Memoir'),
(110, 'Mental Health'),
(141, 'Mental Illness'),
(46, 'Middle Grade'),
(147, 'Modern Classics'),
(129, 'Monsters'),
(90, 'Mystery'),
(93, 'Mystery Thriller'),
(125, 'Mythology'),
(146, 'New York'),
(149, 'Nonfiction'),
(53, 'Novels'),
(60, 'Paranormal'),
(61, 'Paranormal Romance'),
(104, 'Philosophy'),
(82, 'Picture Books'),
(103, 'Plays'),
(83, 'Poetry'),
(68, 'Politics'),
(41, 'Post Apocalyptic'),
(140, 'Psychology'),
(54, 'Read For School'),
(75, 'Realistic Fiction'),
(148, 'Religion'),
(38, 'Romance'),
(108, 'Russia'),
(109, 'Russian Literature'),
(50, 'School'),
(37, 'Science Fiction'),
(48, 'Science Fiction Fantasy'),
(142, 'Scotland'),
(106, 'Self Help'),
(86, 'Short Stories'),
(135, 'Space Opera'),
(161, 'Spain'),
(121, 'Spanish Literature'),
(105, 'Spirituality'),
(160, 'Steampunk'),
(62, 'Supernatural'),
(92, 'Suspense'),
(144, 'Sweden'),
(40, 'Teen'),
(91, 'Thriller'),
(119, 'Time Travel'),
(134, 'Unfinished'),
(63, 'Urban Fantasy'),
(59, 'Vampires'),
(139, 'Victorian'),
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
(54, 'Ace Books'),
(7, 'Alfred A. Knopf'),
(72, 'Alfred A. Knopf Books for Young Readers'),
(50, 'Algonquin Books'),
(32, 'Amy Einhorn Books/G.P. Putnams Sons'),
(17, 'Anchor'),
(52, 'Anchor Books'),
(59, 'Arthur A. Levine Books / Scholastic Inc.'),
(58, 'Avon Books'),
(40, 'Back Bay Books'),
(10, 'Ballantine Books'),
(45, 'Bantam'),
(71, 'Bantam Books'),
(77, 'Black Swan'),
(42, 'Childrens Classics'),
(13, 'Del Rey'),
(62, 'Dell Publishing Company'),
(51, 'Dial Press'),
(41, 'Disney Hyperion Books'),
(76, 'Doubleday &amp; Company, Inc.'),
(56, 'Doubleday Books'),
(12, 'Dutton Books'),
(75, 'Dutton Juvenile'),
(53, 'Ember'),
(68, 'Farrar, Straus and Giroux'),
(74, 'Grand Central Publishing'),
(35, 'Harcourt, Inc.'),
(39, 'Harper'),
(69, 'Harper Perennial'),
(4, 'Harper Perennial Modern Classics'),
(9, 'HarperCollins'),
(14, 'HarperCollins Publishers'),
(36, 'HarperCollinsPublishers'),
(26, 'HarperOne'),
(38, 'HarperPerennial / Perennial Classics'),
(66, 'Houghton Mifflin Harcourt'),
(23, 'Katherine Tegen Books'),
(65, 'Knopf'),
(6, 'Little, Brown and Company'),
(31, 'Macmillan Audio'),
(30, 'Margaret K. McElderry Books'),
(5, 'Modern Library'),
(28, 'MTV Books/Pocket Books'),
(55, 'NAL Trade'),
(16, 'Norton'),
(57, 'Oxford University Press'),
(27, 'Penguin'),
(24, 'Penguin Books'),
(21, 'Penguin Classics'),
(20, 'Penguin Group (USA)'),
(1, 'Penguin Random House'),
(73, 'Plume'),
(64, 'Puffin Books'),
(46, 'Puffin Books (US/CAN)'),
(48, 'Random House Books for Young Readers'),
(19, 'Random House: Modern Library'),
(70, 'Razorbill'),
(47, 'Red Fox'),
(43, 'Riverhead Books'),
(34, 'Scholastic Inc'),
(3, 'Scholastic Inc.'),
(2, 'Scholastic Press'),
(29, 'Scribner'),
(49, 'Seal Books'),
(60, 'Signet'),
(33, 'Signet Book'),
(8, 'Signet Classics'),
(22, 'Simon &amp; Schuster'),
(25, 'Simon Schuster'),
(15, 'Singet Classics'),
(44, 'Square Fish'),
(61, 'Vintage'),
(18, 'Vintage Books USA'),
(67, 'W. W. Norton &amp; Company'),
(11, 'Warner Books'),
(63, 'Washington Square Press'),
(37, 'Zola Books');

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
(13, 'John', 'Doe', 'johndoe@gmail.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Makati', 'National Capital Region', 'Philippines', 1, 0, 0, '2022-07-19'),
(14, 'Jane', 'Doe', 'janedoe@gmail.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Makati', 'National Capital Region', 'Philippines', 1, 0, 0, '2022-12-09');

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
  MODIFY `announcement_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;
--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `book_authors`
--
ALTER TABLE `book_authors`
  MODIFY `book_author_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;
--
-- AUTO_INCREMENT for table `book_genres`
--
ALTER TABLE `book_genres`
  MODIFY `book_genres_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1264;
--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_item_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `event_types`
--
ALTER TABLE `event_types`
  MODIFY `event_type_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `formats`
--
ALTER TABLE `formats`
  MODIFY `format_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;
--
-- AUTO_INCREMENT for table `impressions`
--
ALTER TABLE `impressions`
  MODIFY `impression_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `publisher_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
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
  MODIFY `user_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
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
