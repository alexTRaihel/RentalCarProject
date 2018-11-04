SELECT U.name, A.roles
FROM user U inner join role A on U.role_id = A.id  where U.name = 'Ivan'