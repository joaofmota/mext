Passos para a criação do projeto MEXT:

1.Visto que a nossa aplicação utiliza a aplicação da Strava, é necessário criar conta na Strava e efetuar um pedido para obtermos as chaves da API.

2.O primeiro recurso a ser criado em Azure, é a base de dados MySQL. Após a criação da base de dados, inicia-se a cloud shell e ativa-se o Azure CLI.
  É necessário criar utilizadores na base de dados, para que se possa proceder à criação e desenvolvimento da base de dados. 
  O ficheiro para a criação dos utilizadores encontra-se com o nome 'createruser'.
  Após os utilizadores serem criados, criam-se as tabelas, utiliza-se o ficheiro com o nome 'tablesCreationMysql'.
  Se preferir inserir dados nas tabelas, pode utilizar o ficheiro 'insertvalues' que contém todos os inserts que é possivel fazer.

3.Após a criação da base de dados, pode-se proceder à criação da Azure Function que vai efetuar um trigger para ativação da API da Strava.
  Este trigger apenas vai realizar um 'GET' request a um endpoint da Strava, que nos devolve o Primeiro Nome, Ultimo Nome, e por fim o género.
  Deve-se colocar na Function o código que se encontra na pasta backend com o nome 'sqlstravatrigger'. Ter em atenção que é necessário colocar
  a access token que nos é dada pela Strava após o 'Bearer' na linha 18. Após este passo é verificar se a função está a funcionar. 
  Após os testes de verificação, é necessário copiar o link da Function que nos é dado para utilizarmos mais tarde.

4.Por último é necessário criar duas Web Static Apps. Seguindo o seguinte tutorial da Microsoft: https://docs.microsoft.com/en-us/azure/app-service/quickstart-html
  Na primeira Web Static App, é necessário utilizar os ficheiros que se encontram na pasta de frontEnd com o nome 'sitee.html' e 'sitee.css'. 
  É necessário seguir os passos do tutorial e verificar se o site está a funcionar.
  Após a verificação, utiliza-se a segunda Web Static App, com os ficheiros que estão na pasta frontEnd com os nomes 'site2.html' e 'sitee2.css'.
  Verificar se está a funcionar e seguir para o próximo passo.

5.Após concluir os passos anteriores, abre-se a primeira Web Static App, e carrega-se no botão 'authenticate with Strava'. 
  A função do botão é ativar o trigger da Azure function que foi criada e inserir o seu Primeiro nome, Ultimo nome e género na base de dados.
  Pode proceder à verificação dos dados na base de dados. Utilizando o Heidi e fazendo a conexão à base de dados seguindo as instruções 
  que estão na página da Base de Dados no Portal Azure. (settings -> connect -> MySQL workbench.
  Nota: A página dois que foi criada ainda não está funcional, mas pode ser acedida clicando em 'next step' na primeira página.
  No entanto, a página dois ainda não está funcional, estamos a trabalhar nisso! :)
   
   
