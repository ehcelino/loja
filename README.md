###Loja!

Estudo em rails de um site de e-commerce dinâmico

***Características

* Website responsivo, funciona em vários formatos de tela
* Interface de loja em formato linhas e colunas
* Carrossel de imagens de produtos com links na página inicial
* Categorias com páginas próprias
* Links nos produtos para compra de uma unidade e para a página do produto
* Compra de mais de uma unidade na página do produto
* Carrinho de compras dinâmico
* Exclusão de produtos específicos do carrinho
* Sistema de gerenciamento de usuários
* Usuário administrador com capacidade de gerenciar produtos
* Gerenciamento de produtos com estoque
* Carrinho de compras vinculado à sessão do usuário
* Indicações visuais em produtos em promoção
* Relatórios de vendas

A fazer

* Usuários com habilidade de controlar produtos sob o administrador (permissões)
* Adicionar dados aos produtos (marca, tamanho, peso, garantia, etc.)
* Dados de frete e cálculo
* Editor HTML para descrição de produtos
* Criar uma tabela e os vínculos para produtos já vendidos. Do jeito que está, uma alteração no produto reflete em uma venda antiga (por ex. alterar o preço do produto altera também na visualização de venda.) É necessária uma tabela que guarde os produtos da forma como eles foram vendidos (sem vínculos) para que quando for visualizada a venda ela seja fiel.

ATENÇÃO: Para o puma conseguir servir arquivos é necessário criar uma variável de ambiente no sistema:

RUNNING_ENV='home'

Ou comentar a seguinte linha em config/puma.rb

bind "tcp://192.168.0.111:3000" if ENV.fetch("RUNNING_ENV") == "home"