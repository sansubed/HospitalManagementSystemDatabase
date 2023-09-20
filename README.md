# HospitalManagementSystemDatabase
Project created using MySQL

## You can view the report written in Latex at:
```
https://www.overleaf.com/read/jpcwpchgmvdx

```

### To run the Project
1. Set up a Yum repository
   ```
   sudo rpm -Uvh https://repo.mysql.com/mysql80-community-release-el7-3.noarch.rpm
  ```
2. Install the latest version of MySQL
  ```
  sudo sed -i 's/enabled=1/enabled=0/' /etc/yum.repos.d/mysql-community.repo
  sudo yum --enablerepo=mysql80-community install mysql-community-server
  ```
3. Start the MySQL service
  ```
  service mysqld start
  sudo grep "A temporary password" /var/log/mysqld.log
  ```
4. Config the MySQL root user
  ```
  mysql_secure_installation 
  ```
5. Log in to MySQL
  ```
  mysql -u root -p
  ```

