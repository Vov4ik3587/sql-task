-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июл 26 2022 г., 10:12
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `clothes_shop`
--
CREATE DATABASE IF NOT EXISTS `clothes_shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `clothes_shop`;

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id_good` int(10) UNSIGNED NOT NULL COMMENT 'идентификатор товара',
  `name_good` varchar(25) NOT NULL COMMENT 'название товара',
  `id_main_picture` int(10) UNSIGNED NOT NULL COMMENT 'идентификатор главной картинки',
  `id_main_section` int(10) UNSIGNED NOT NULL COMMENT 'идентификатор основного раздела',
  `price_discount` int(6) UNSIGNED DEFAULT NULL COMMENT 'цена со скидкой',
  `price` int(6) UNSIGNED NOT NULL COMMENT 'цена без скидки',
  `price_promo` int(6) UNSIGNED NOT NULL COMMENT 'цена по промокоду',
  `description_good` text NOT NULL COMMENT 'описание товара',
  `availability` tinyint(1) NOT NULL COMMENT 'наличие товара'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='таблица характеристик товара';

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id_good`, `name_good`, `id_main_picture`, `id_main_section`, `price_discount`, `price`, `price_promo`, `description_good`, `availability`) VALUES
(1, 'Рубашка Medicine One', 1, 3, 2499, 2699, 2227, 'Рубашка Medicine выполнена из вискозной ткани с клетчатым узором.\r\nДетали: прямой крой; отложной воротник; планка и манжеты на пуговицах;\r\nкарман на груди.', 1),
(2, 'Брюки Tommy One', 4, 6, NULL, 4999, 4499, 'Брюки Tommy из жакарта и ...', 1),
(3, 'Брюки Medicine One', 4, 5, 3999, 5999, 3499, 'Брюки бренда Medicine', 1),
(4, 'Рубашка Tommy One', 2, 4, NULL, 6999, 6499, 'Рубашка бренда Tommy', 1),
(5, 'Рубашка Medicine Two', 2, 3, 2999, 3499, 3199, 'Рубашка Medicine Two, ...', 1),
(6, 'Рубашка Tommy Two', 2, 4, 2899, 3299, 2999, 'Рубашка Tommy Two, ...', 1),
(7, 'Брюки Medicine Two', 6, 5, 2999, 3499, 3199, 'Брюки Medicine Two, ...', 1),
(8, 'Брюки Tommy Two', 4, 6, 2799, 3799, 2699, 'Брюки Tommy Two, ...', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `good_picture`
--

CREATE TABLE `good_picture` (
  `ID` int(10) UNSIGNED NOT NULL,
  `id_good` int(10) UNSIGNED NOT NULL COMMENT 'идентификатор товара',
  `id_picture` int(10) UNSIGNED NOT NULL COMMENT 'идентификатор картинки'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `good_picture`
--

INSERT INTO `good_picture` (`ID`, `id_good`, `id_picture`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(6, 2, 6),
(7, 3, 4),
(8, 3, 6),
(9, 4, 1),
(10, 4, 2),
(11, 4, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `picture`
--

CREATE TABLE `picture` (
  `id_picture` int(10) UNSIGNED NOT NULL COMMENT 'идентификатор картинки',
  `path_picture` varchar(50) NOT NULL COMMENT 'путь к картинке',
  `attribute_alt` varchar(50) NOT NULL COMMENT 'атрибут ALT к картинке'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='таблица картинок';

--
-- Дамп данных таблицы `picture`
--

INSERT INTO `picture` (`id_picture`, `path_picture`, `attribute_alt`) VALUES
(1, './data/img/shirt1.png', 'Рубашка 1'),
(2, './data/img/shirt2.png', 'Рубашка 2'),
(3, './data/img/shirt3.png', 'Рубашка 3'),
(4, './data/img/pants1.png', 'Брюки 1'),
(6, './data/img/pants2.png', 'Брюки 2');

-- --------------------------------------------------------

--
-- Структура таблицы `sections`
--

CREATE TABLE `sections` (
  `id_section` int(10) UNSIGNED NOT NULL COMMENT 'идентификатор раздела',
  `name_section` varchar(25) NOT NULL COMMENT 'название раздела',
  `description` text NOT NULL COMMENT 'описание раздела',
  `id_parent_section` int(10) UNSIGNED DEFAULT NULL COMMENT 'идентификатор родительского раздела'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sections`
--

INSERT INTO `sections` (`id_section`, `name_section`, `description`, `id_parent_section`) VALUES
(1, 'Рубашки', 'Рубашки всех брендов, мужские, женские, детские', NULL),
(2, 'Брюки', 'Брюки, джинсы, мужские, женские', NULL),
(3, 'Рубашки Medicine', 'Рубашки бренда Medicine', 1),
(4, 'Рубашки Tommy', 'Рубашки бренда Tommy', 1),
(5, 'Брюки Medicine', 'Брюки бренда Medicine', 2),
(6, 'Брюки Tommy', 'Брюки бренда Tommy', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `section_good`
--

CREATE TABLE `section_good` (
  `ID` int(10) UNSIGNED NOT NULL,
  `id_section` int(10) UNSIGNED NOT NULL COMMENT 'идентификатор раздела',
  `id_good` int(10) UNSIGNED NOT NULL COMMENT 'идентификатор товара'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `section_good`
--

INSERT INTO `section_good` (`ID`, `id_section`, `id_good`) VALUES
(1, 1, 1),
(2, 1, 4),
(3, 2, 3),
(4, 2, 3),
(5, 3, 1),
(6, 3, 3),
(7, 4, 2),
(8, 4, 4);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id_good`),
  ADD KEY `id_main_picture` (`id_main_picture`),
  ADD KEY `id_main_section` (`id_main_section`);

--
-- Индексы таблицы `good_picture`
--
ALTER TABLE `good_picture`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_good` (`id_good`),
  ADD KEY `id_picture` (`id_picture`);

--
-- Индексы таблицы `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id_picture`);

--
-- Индексы таблицы `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id_section`),
  ADD UNIQUE KEY `id_section_3` (`id_section`),
  ADD KEY `id_section` (`id_section`);

--
-- Индексы таблицы `section_good`
--
ALTER TABLE `section_good`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_good` (`id_good`),
  ADD KEY `id_section` (`id_section`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id_good` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор товара', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `good_picture`
--
ALTER TABLE `good_picture`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `picture`
--
ALTER TABLE `picture`
  MODIFY `id_picture` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор картинки', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `sections`
--
ALTER TABLE `sections`
  MODIFY `id_section` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор раздела', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `section_good`
--
ALTER TABLE `section_good`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `goods`
--
ALTER TABLE `goods`
  ADD CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`id_main_picture`) REFERENCES `picture` (`id_picture`),
  ADD CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`id_main_section`) REFERENCES `sections` (`id_section`);

--
-- Ограничения внешнего ключа таблицы `good_picture`
--
ALTER TABLE `good_picture`
  ADD CONSTRAINT `good_picture_ibfk_1` FOREIGN KEY (`id_good`) REFERENCES `goods` (`id_good`),
  ADD CONSTRAINT `good_picture_ibfk_2` FOREIGN KEY (`id_picture`) REFERENCES `picture` (`id_picture`);

--
-- Ограничения внешнего ключа таблицы `section_good`
--
ALTER TABLE `section_good`
  ADD CONSTRAINT `section_good_ibfk_1` FOREIGN KEY (`id_good`) REFERENCES `goods` (`id_good`),
  ADD CONSTRAINT `section_good_ibfk_2` FOREIGN KEY (`id_section`) REFERENCES `sections` (`id_section`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
