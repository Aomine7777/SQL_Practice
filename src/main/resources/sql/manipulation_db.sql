--Отримати всі стовпці з таблиці users.
select
    *
from
    users u ;
--Отримати імена користувачів з таблиці users, де електронна пошта містить '@gmail.com'.
select
    username
from
    users u
where
        email like '%@gmail.com';
--Отримати ім'я користувача та дату замовлення з таблиць users та orders, з'єднуючи за user_id.
select
    u.username,
    o.order_date
from
    users u
        left join orders o
                  on
                          u.id = o.user_id ;
--	Порахувати загальну кількість замовлень, зроблених кожним користувачем.
select
    u.username,
    sum(o.total_amount) as total_spent
from
    users u
        join orders o on
            u.id = o.user_id
        join products p on
            o.id = p.id
group by
    u.username;
--	Вивести імена користувачів з таблиці users в алфавітному порядку
select
    u.username
from
    users u
order by
    u.username asc;
-- Отримати перші 2 замовлень з таблиці orders.
select
    *
from
    orders o
order by
    order_date
    limit 2;
-- Підзапит: Знайти імена користувачів, які зробили замовлення за останній місяць.
select
    username
from
    users
where
        id in (
        select
            user_id
        from
            orders
        where
                order_date >= date_trunc('month',
                                         current_date) - interval '1 month'
  and order_date < date_trunc('month',
    current_date)
    );
-- Count з фільтром: Порахувати кількість замовлень, зроблених користувачами, імена яких починаються на 'A'.
select
    count(o.id) as order_count
from
    orders o
        join users u on
            o.user_id = u.id
where
        u.username like 'A%';

-- Рядкові функції: Отримати доменні імена (після '@') з адрес електронної пошти в таблиці users.
select
    SPLIT_PART(email,
               '@',
               2) as domain_name
from
    users;
-- Функції дати: Розрахувати різницю (у днях) між поточною датою та датою замовлення для кожного замовлення.
select
    o.id as order_id,
    CURRENT_DATE - o.order_date as days_difference
from
    orders o;
-- Нульові значення: Знайти користувачів, які не зробили жодного замовлення.
select
    u.id ,
    u.username
from
    users u
        left join orders o on
            u.id = o.user_id
where
    o.id is null;
--Оновлення: Оновити ціну певного товару в таблиці products.
update
    products
set
    price = 27.7
where
        id = 1 ;
--Вставка: Додати нового користувача до таблиці users.
insert
into
    users(username,
          email)
values ('Jack',
        'jack@com.ua');
--Видалення: Видалити всі замовлення, зроблені певним коsристувачем, з таблиці orders.
delete
from
    orders
where
        user_id = 2;