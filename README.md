<h3>sql codes for study and work<h3>
<br>
<hr>
    
```sql

CREATE DATABASE estudo_sql;
USE estudo_sql;

-- Tabela de funcionários
CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    setor VARCHAR(50),
    salario DECIMAL(10,2)
);
-- Tabela de vendas
CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT,
    valor DECIMAL(10,2),
    FOREIGN KEY (funcionario_id)
        REFERENCES funcionarios(id)
);

```
