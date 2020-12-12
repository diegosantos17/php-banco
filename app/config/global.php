<?php 
define("HOST", "http://localhost:8012");
define("BASE", "/php-banco/");
define("UNSET_COUNT", 1);

define("DB_HOST", "localhost");
define("DB_USER", "root");
define("DB_PASS", "");
define("DB_NAME", "db_diego_logistica");

define("LOGINFOFLAG", true);
define("LOGDEBUGFLAG", true);

define("PRIVATE_KEY", "trainingPooSecret");

define("EMAIL_SMTP", "smtp.gmail.com");
define("EMAIL_USERNAME", "diegosr.trainning@gmail.com");
define("EMAIL_SENHA", "Traninning#40");
define("EMAIL_FROM", "diegosr.trainning@gmail.com");
define("EMAIL_FROM_NAME", "DR Logistica");
define("EMAIL_PORT", 587);

define("UPLOAD_IMAGE_USUARIO", BASE . "img/usuario/");
define("PATH_IMAGEM_USUARIO", "../public/img/usuario");

define("EMAIL_FROM_NAME_ERRO", "[ERRO] DR Logistica");
define("EMAIL_TI", "diegoallinone@gmail.com");
define("RESPONSAVEL_TI", "Diego Rodrigues");


// Status Motorista
define("MOTORISTA_REGULAR", 1);
define("MOTORISTA_ATESTADO", 2);
define("MOTORISTA_BLACK_LIST", 3);
define("MOTORISTA_FERIAS", 4);
define("MOTORISTA_OBITO", 5);
define("MOTORISTA_CNH_VENCIDA", 6);
define("MOTORISTA_LICENCA_MATERNIDADE", 8);
