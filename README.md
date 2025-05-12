Все зробив як вказано в завданні. 
Написав спочатку docker-compose.yml файл і перевіряв які контейнери запустилися, мережу, підключався до бази.

![docker1](https://github.com/user-attachments/assets/7391cc11-6451-4128-8103-79c58e5c4270)
![docker2](https://github.com/user-attachments/assets/8a9650b0-6b6a-4bbb-ab96-9ae1e64e367b)
![docker3](https://github.com/user-attachments/assets/8ba2bb49-03a2-4cb5-b0ed-c2d6a5a8e7c1)
![docker4](https://github.com/user-attachments/assets/43eb3d23-4a2f-4fcd-80a1-a0ae9736fe78)
![docker6](https://github.com/user-attachments/assets/8fa8f22e-e70c-4190-82c2-67bbaceddc1c)
![docker7](https://github.com/user-attachments/assets/e08e463e-5857-4f79-ba51-fd1f3a4d08c0)

Але при маштабувані була проблемка з тим, що був зайнятий порт 8080 web сервісем і тому не створювалися додаткові контейнери. (перша версія _docker-compose.yml)
![docker8](https://github.com/user-attachments/assets/a204a239-f9ea-48ac-93f7-3dbf87d2a7b3)

Погуглив, пошукав рішення, і зробив типу лоад балансер nginx reverse proxy, який мапуємо з 80 портом на веб сервіс і виставляємо на світ 8080 порт. Проксі має свій конфіг і при збільшені інстансів веб не було проблем з зайнятими портами. 
![docker9](https://github.com/user-attachments/assets/75c33309-53d1-432d-bf8b-487ddc23111c)
![docker10](https://github.com/user-attachments/assets/79ad09ab-368a-4e48-b639-627dafbedce5)
![docker11](https://github.com/user-attachments/assets/9cee9c23-6787-46cf-9b1d-d38d6c419cf6)






