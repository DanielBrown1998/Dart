// ENTRADA: Uma lista de registos de vendas. Não modifique esta lista.
const salesData = [
  {
    'product': 'Laptop Pro',
    'category': 'Computadores',
    'price': 1200.0,
    'unitsSold': 20,
  },
  {
    'product': 'Mouse Gamer',
    'category': 'Acessórios',
    'price': 50.0,
    'unitsSold': 150,
  },
  {
    'product': 'Teclado Mecânico',
    'category': 'Acessórios',
    'price': 80.0,
    'unitsSold': 100,
  },
  {
    'product': 'Monitor 4K',
    'category': 'Monitores',
    'price': 400.0,
    'unitsSold': 30,
  },
  {
    'product': 'Webcam HD',
    'category': 'Acessórios',
    'price': 35.0,
    'unitsSold': 200,
  },
  {
    'product': 'Desktop Gamer',
    'category': 'Computadores',
    'price': 1500.0,
    'unitsSold': 15,
  },
  {
    'product': 'Monitor Ultrawide',
    'category': 'Monitores',
    'price': 600.0,
    'unitsSold': 25,
  },
];
Map<String, Map<String, dynamic>> analyzeSalesData(
  List<Map<String, dynamic>> sales,
) {
  final totalRevenue = "totalRevenue";
  final bestSellingProduct = "bestSellingProduct";

  Map<String, Map<String, dynamic>> summary = {};
  for (var item in sales) {
    if (summary.containsKey(item["category"])) {
      summary[item["category"]] = {
        totalRevenue: summary[item["category"]]![totalRevenue] + item["price"]*item["unitsSold"],
        bestSellingProduct:
            (summary[item["category"]]![totalRevenue] >=
                item["price"] * item["unitsSold"])
            ? summary[item["category"]]![bestSellingProduct]
            : item["product"],
      };
    } else {
      summary[item["category"]] = {
        totalRevenue: item["price"]*item["unitsSold"],
        bestSellingProduct: item["product"],
      };
    }
  }
  // print(summary);
  return summary;
}

// Ponto de entrada principal para testar a sua função.
void main() {
  final summary = analyzeSalesData(salesData);

  // Imprime o resultado para verificação.
  summary.forEach((category, data) {
    print('Categoria: $category');
    print('  Receita Total: \$${data['totalRevenue']}');
    print('  Produto Mais Vendido: ${data['bestSellingProduct']}');
    print('---');
  });
}
