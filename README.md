# Домашнее задание к занятию «Основы Terraform. Yandex Cloud»
 
## Задание 1
- Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
- Создайте сервисный аккаунт и ключ. service_account_key_file.
- Сгенерируйте новый или используйте свой текущий ssh-ключ. Запишите его открытую(public) часть в переменную vms_ssh_public_root_key.
- Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.
   ### ОТВЕТ: В исходном коде ошибка заключалась в неправильном написании значения platform - standarT (данный параметр определяет,  какое физическое оборудование использовать для размещения ВМ). Также было неправильно указано значение core_fraction (platform-v4 не поддерживает значение "5", а сам параметр core_fraction определяет уровень производительности vCPU). 
  
- Подключитесь к консоли ВМ через ssh и выполните команду  curl ifconfig.me. Примечание: К OS ubuntu "out of a box, те из коробки" необходимо подключаться под пользователем ubuntu: "ssh ubuntu@vm_ip_address". Предварительно убедитесь, что ваш ключ - добавлен в ssh-агент: eval $(ssh-agent) && ssh-add Вы познакомитесь с тем как при создании ВМ создать своего пользователя в блоке metadata в следующей лекции.;
- Ответьте, как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ.
   ### ОТВЕТ: Параметр preemptible = true опеределяет то, что ВМ будет прерываемой (в процессе обучения это поможет сохранить финансы, поскольку данный тип ВМ можно принудительно остановить и она расходует намного меньше ресурсов). core_fraction=5 отвечает за производительности vCPU и также влияет на конечную стоимость виртуальной машины.

В качестве решения приложите:

- скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес;
<img width="804" height="435" alt="image" src="https://github.com/user-attachments/assets/e9bc7e15-abf1-4d46-bccd-17af2a7c5a56" />

 - скриншот консоли, curl должен отобразить тот же внешний ip-адрес;
<img width="495" height="57" alt="image" src="https://github.com/user-attachments/assets/d6eded9a-1ad9-48ae-9619-797be56c8d9f" />


## Задание 2
- Замените все хардкод-значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. К названиям переменных ВМ добавьте в начало префикс vm_web_ . Пример: vm_web_name.
- Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их default прежними значениями из main.tf.
- Проверьте terraform plan. Изменений быть не должно.
  <img width="401" height="426" alt="image" src="https://github.com/user-attachments/assets/71c6b742-b420-489a-a9df-54b25f0bee06" />

  <img width="385" height="136" alt="image" src="https://github.com/user-attachments/assets/b2b61e00-02c4-40cc-8c69-7625c3eb0f25" />


## Задание 3
- Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
- Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: "netology-develop-platform-db" , cores  = 2, memory = 2, core_fraction = 20. Объявите её переменные с префиксом vm_db_ в том же файле ('vms_platform.tf'). ВМ должна работать в зоне "ru-central1-b"
- Примените изменения.
  <img width="799" height="461" alt="image" src="https://github.com/user-attachments/assets/6b19667b-f30e-42f8-8c82-9edd5055f9c8" />

  <img width="321" height="134" alt="image" src="https://github.com/user-attachments/assets/b253910f-6739-4d7b-a062-6b17d83abb39" />


## Задание 4
- Объявите в файле outputs.tf один output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.(без хардкода!!!)
Примените изменения.
- В качестве решения приложите вывод значений ip-адресов команды terraform output.
  <img width="597" height="273" alt="image" src="https://github.com/user-attachments/assets/3ee8bad9-4cb5-411a-a0cc-fe541d414558" />


## Задание 5
- В файле locals.tf опишите в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
- Замените переменные внутри ресурса ВМ на созданные вами local-переменные.
- Примените изменения.
  <img width="510" height="49" alt="image" src="https://github.com/user-attachments/assets/bc726563-e04f-4149-9c80-2dbbc584252a" />
  
  <img width="712" height="48" alt="image" src="https://github.com/user-attachments/assets/422dac40-5d64-4252-bf8a-b647f50a8e2f" />
  
  <img width="609" height="275" alt="image" src="https://github.com/user-attachments/assets/8e960658-c6f0-4e67-b539-597110dbc55f" />

