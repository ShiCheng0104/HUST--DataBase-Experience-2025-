 请给出ER图文件存放的URL:
https://github.com/ShiCheng0104/HUST--DataBase-Experience-2025-/blob/main/ersolution.png
 以下给出关系模式：
movie(movie_ID, title, type, runtime, release_date, director, starring), 主码(movie_ID)
customer(c_ID, name, phone), 主码(c_ID)
hall(hall_ID, mode, capacity, location), 主码(hall_ID)
schedule(schedule_ID, date, time, price, number, movie_ID, hall_ID), 主码(schedule_ID), 外码(movie_ID, hall_ID)
ticket(ticket_ID, seat_num, c_ID, schedule_ID), 主码(ticket_ID), 外码(c_ID, schedule_ID)








