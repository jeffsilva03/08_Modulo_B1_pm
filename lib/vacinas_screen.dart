import 'package:flutter/material.dart';

class VacinaScreen extends StatefulWidget {
  const VacinaScreen({super.key});

  @override
  State<VacinaScreen> createState() => _VacinaScreenState();
}

class _VacinaScreenState extends State<VacinaScreen> {
  final List<Map<String, String>> animais = [
    {'nome': 'Cavalo', 'imagem': 'assets/images/cavalo.jpg'},
    {'nome': 'Vaca', 'imagem': 'assets/images/vaca.jpg'},
    {'nome': 'Porco', 'imagem': 'assets/images/porco.jpg'},
  ];

  String? statusSelecionado;

  @override
  Widget build(BuildContext context) {
    final verde = const Color(0xFF2E7D32);
    final cinzaFundo = const Color(0xFFF4F5F4);
    final sombraCard = Colors.black.withOpacity(0.06);

    return Scaffold(
      backgroundColor: cinzaFundo,
      appBar: AppBar(
        title: const Text(
          'Vacinas',
          style: TextStyle(fontFamily: "MontserratBold",
),
        ),
        backgroundColor: cinzaFundo,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: GridView.builder(
          itemCount: animais.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final animal = animais[index];
            return GestureDetector(
              onTap: () {
                statusSelecionado = null;
                _abrirModalVacina(context, animal, verde);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: sombraCard,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                      child: Image.asset(
                        animal['imagem']!,
                        height: 350,
                        width: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      animal['nome']!,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "MontserratBold",
                        color: verde,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _abrirModalVacina(
      BuildContext context, Map<String, String> animal, Color verde) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(40),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: StatefulBuilder(
              builder: (context, setStateModal) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          animal['nome']!,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "MontserratBold",
                            color: verde,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close_rounded, size: 28),
                          color: Colors.grey.shade600,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        animal['imagem']!,
                        height: 180,
                        width: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Foi vacinado?',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "MontserratMedium",
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(height: 12),
                    RadioListTile<String>(
                      title: const Text('Sim'),
                      value: 'sim',
                      activeColor: verde,
                      groupValue: statusSelecionado,
                      onChanged: (value) =>
                          setStateModal(() => statusSelecionado = value),
                    ),
                    RadioListTile<String>(
                      title: const Text('Vacinação não realizada'),
                      value: 'nao',
                      activeColor: verde,
                      groupValue: statusSelecionado,
                      onChanged: (value) =>
                          setStateModal(() => statusSelecionado = value),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.save_rounded),
                            label: const Text('Salvar'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: verde,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontFamily: "MontserratMedium",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.close_rounded),
                            label: const Text('Fechar'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: verde,
                              side: BorderSide(color: verde, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontFamily: "MontserratMedium",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
