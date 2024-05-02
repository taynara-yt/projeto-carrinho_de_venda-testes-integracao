import 'package:test/test.dart';
import 'package:venda/carrinho_venda.dart';
import 'package:venda/item.dart';

void main() {
  group('Teste do calculo do valor total do carrinho', (){
    test('Deve calcular o valor total do carrinho quando estiver vazio.', (){
      // Preparação
      // Nenhum Item no carrinho
      final itens = <Item>[]; //lista de itens
      final carrinho = CarrinhoVenda(listaItems: itens);

      //Execução
      var total = carrinho.totalCarrinho();

      // Verificação
      expect(total, 0.0);

    });

    test('Deve calcular o valor total do carrinho com itens, sem desconto.', (){
      //Preparação
      //Inserir elementos no carrinho
      final itens =[
        Item(nome: 'Arroz', quantidade: 3, preco: 6.30),
        Item(nome: 'Feijão', quantidade: 2, preco: 7.50),
        Item(nome: 'Farinha Uarini', quantidade: 3, preco: 14.00)
      ];
      final carrinho = CarrinhoVenda(listaItems: itens);
      double valorEsperado = 75.90;

      //Execução
      var total = carrinho.totalCarrinho();

      //Verificação
      expect(total.toStringAsFixed(2), valorEsperado.toStringAsFixed(2));
    });
  });

  group('Deve calcular o valor total do carrinho com itens e com desconto', () {
    test('Deve calcular o valor total do carrinho com itens e desconto de 5%', () {
      //Preparação
      //Inserir elementos no carrinho
      final itens =[
        Item(nome: 'Arroz', quantidade: 3, preco: 6.30),
        Item(nome: 'Feijão', quantidade: 2, preco: 7.50),
        Item(nome: 'Farinha Uarini', quantidade: 3, preco: 14.00)
      ];
      final carrinho = CarrinhoVenda(listaItems: itens);
      double valorEsperado = 72.11;

      //Execução
      var total = carrinho.totalCarrinho(5);

      //Verificação
      expect(total.toStringAsFixed(2), valorEsperado.toStringAsFixed(2));
    });

    test('Deve calcular o valor total do carrinho com itens e desconto de 10%', () {
      //Preparação
      //Inserir elementos no carrinho
      final itens =[
        Item(nome: 'Arroz', quantidade: 3, preco: 6.30),
        Item(nome: 'Feijão', quantidade: 2, preco: 7.50),
        Item(nome: 'Farinha Uarini', quantidade: 3, preco: 14.00)
      ];
      final carrinho = CarrinhoVenda(listaItems: itens);
      double valorEsperado = 68.31;

      //Execução
      var total = carrinho.totalCarrinho(10);

      //Verificação
      expect(total.toStringAsFixed(2), valorEsperado.toStringAsFixed(2));
    });

    test('Deve calcular o valor total do carrinho com itens e desconto de 15%', () {
      //Preparação
      //Inserir elementos no carrinho
      final itens =[
        Item(nome: 'Arroz', quantidade: 3, preco: 6.30),
        Item(nome: 'Feijão', quantidade: 2, preco: 7.50),
        Item(nome: 'Farinha Uarini', quantidade: 3, preco: 14.00)
      ];
      final carrinho = CarrinhoVenda(listaItems: itens);
      double valorEsperado = 64.52;

      //Execução
      var total = carrinho.totalCarrinho(15);

      //Verificação
      expect(total.toStringAsFixed(2), valorEsperado.toStringAsFixed(2));
    });
  });

  group('Novos recursos para fazer testes', () {
    test('Deve verificar a quantidade de itens do carrinho', () {
      //Preparação
       final itens =[
        Item(nome: 'Arroz', quantidade: 3, preco: 6.30),
        Item(nome: 'Feijão', quantidade: 2, preco: 7.50),
        Item(nome: 'Farinha Uarini', quantidade: 3, preco: 14.00)
      ];

      //Execução
      final carrinho = CarrinhoVenda(listaItems: itens);

      //Verificação
      expect(carrinho.listaItems.length, 3);
      
    });

    test('Deve verificar se os elementos do carrinho são do tipo Item.', () {
      //Preparação
      final itens =[
        Item(nome: 'Arroz', quantidade: 3, preco: 6.30),
        Item(nome: 'Feijão', quantidade: 2, preco: 7.50),
        Item(nome: 'Farinha Uarini', quantidade: 3, preco: 14.00)
      ];

      //Execução
      final carrinho = CarrinhoVenda(listaItems: itens);

      //Verificação
      expect(carrinho.listaItems, isA<List<Item>>());
      
    });

    test('Deve verificar se um determinado item está inserido no carrinho', () {
      //Preparação
      final itens =[
        Item(nome: 'Arroz', quantidade: 3, preco: 6.30),
        Item(nome: 'Feijão', quantidade: 2, preco: 7.50),
        Item(nome: 'Farinha Uarini', quantidade: 3, preco: 14.00)
      ];

      //Execução
      final carrinho = CarrinhoVenda(listaItems: itens);

      //Verificação
      expect(carrinho.listaItems, 
        contains(Item(nome: 'Feijão', quantidade: 2, preco: 7.50)));
        
    });

  });

  group('Deve verificar as Exceções customizadas', () {
    test('Deve verificar a Exceção customizada referente ao nome do item vazio.', () {
      //Preparação
      final itens =[
        Item(nome: 'Arroz', quantidade: 3, preco: 6.30),
        Item(nome: '', quantidade: 2, preco: 7.50),
        Item(nome: 'Farinha Uarini', quantidade: 3, preco: 14.00)
      ];
      final carrinho = CarrinhoVenda(listaItems: itens);

      //Execução
      //Atribui a função: carrinho.totalCarrinho para a variavel call
      var call = carrinho.totalCarrinho;

      //Verificação
      //Verificação de Exceção customizada
      expect(() => call(), throwsA(isA<CarrinhoItemNomeVazio>()));
      
    });

    test('Deve verificar a Exceção customizada referente a quantidade do item for ZERO.', () {
       //Preparação
      final itens =[
        Item(nome: 'Arroz', quantidade: 3, preco: 6.30),
        Item(nome: 'Feijão', quantidade: 0, preco: 7.50),
        Item(nome: 'Farinha Uarini', quantidade: 3, preco: 14.00)
      ];
      final carrinho = CarrinhoVenda(listaItems: itens);

      //Execução
      //Atribui a função: carrinho.totalCarrinho para a variavel call
      var call = carrinho.totalCarrinho;

      //Verificação
      //Verificação de Exceção customizada
      expect(() => call(), throwsA(isA<CarrinhoItemQuantidadeZero>()));
    });

    test('Deve verificar a Exceção customizada referente ao preço do item for ZERO.', () {
      //Preparação
      final itens =[
        Item(nome: 'Arroz', quantidade: 3, preco: 6.30),
        Item(nome: 'Feijão', quantidade: 2, preco: 0.00),
        Item(nome: 'Farinha Uarini', quantidade: 3, preco: 14.00)
      ];
      final carrinho = CarrinhoVenda(listaItems: itens);

      //Execução
      //Atribui a função: carrinho.totalCarrinho para a variavel call
      var call = carrinho.totalCarrinho;

      //Verificação
      //Verificação de Exceção customizada
      expect(() => call(), throwsA(isA<CarrinhoItemPrecoZero>())); 
    });

    test('Deve verificar a Exceção customizada ao preço do item for NEGATIVO', () {
      //Preparação
      final itens =[
        Item(nome: 'Arroz', quantidade: 3, preco: -6.30),
        Item(nome: 'Feijão', quantidade: 2, preco: 0.00),
        Item(nome: 'Farinha Uarini', quantidade: 3, preco: 14.00)
      ];
      final carrinho = CarrinhoVenda(listaItems: itens);

      //Execução
      //Atribui a função: carrinho.totalCarrinho para a variavel call
      var call = carrinho.totalCarrinho;

      //Verificação
      //Verificação de Exceção customizada
      expect(() => call(), throwsA(isA<CarrinhoItemPrecoNegativo>()));
      
    });

     test('Deve verificar a Exceção customizada a quantidade do item for NEGATIVO', () {
      //Preparação
      final itens =[
        Item(nome: 'Arroz', quantidade: -3, preco: 6.30),
        Item(nome: 'Feijão', quantidade: 2, preco: 0.00),
        Item(nome: 'Farinha Uarini', quantidade: 3, preco: 14.00)
      ];
      final carrinho = CarrinhoVenda(listaItems: itens);

      //Execução
      //Atribui a função: carrinho.totalCarrinho para a variavel call
      var call = carrinho.totalCarrinho;

      //Verificação
      //Verificação de Exceção customizada
      expect(() => call(), throwsA(isA<CarrinhoItemQuantidadeNegativo>()));
      
    });

  });


}