import 'package:flutter/material.dart';
import 'vacinas_screen.dart';

class AnimaisScreen extends StatefulWidget {
  const AnimaisScreen({super.key});

  @override
  State<AnimaisScreen> createState() => _AnimaisScreenState();
}


// declaração dos dados de animais
class _AnimaisScreenState extends State<AnimaisScreen> {
  final List<Map<String, String>> animais = [
    {'nome': 'Cavalo', 'imagem': 'assets/images/cavalo.jpg'},
    {'nome': 'Vaca', 'imagem': 'assets/images/vaca.jpg'},
    {'nome': 'Porco', 'imagem': 'assets/images/porco.jpg'},
    {'nome': 'Cavalo', 'imagem': 'assets/images/cavalo.jpg'},
    {'nome': 'Vaca', 'imagem': 'assets/images/vaca.jpg'},
    {'nome': 'Porco', 'imagem': 'assets/images/porco.jpg'},
    {'nome': 'Cavalo', 'imagem': 'assets/images/cavalo.jpg'},
    {'nome': 'Vaca', 'imagem': 'assets/images/vaca.jpg'},
    {'nome': 'Porco', 'imagem': 'assets/images/porco.jpg'},
    {'nome': 'Cavalo', 'imagem': 'assets/images/cavalo.jpg'},
    {'nome': 'Vaca', 'imagem': 'assets/images/vaca.jpg'},
    {'nome': 'Porco', 'imagem': 'assets/images/porco.jpg'},
    {'nome': 'Cavalo', 'imagem': 'assets/images/cavalo.jpg'},
    {'nome': 'Vaca', 'imagem': 'assets/images/vaca.jpg'},
    {'nome': 'Porco', 'imagem': 'assets/images/porco.jpg'},

  ];

  Map<String, String>? animalSelecionado;

  final nomeController = TextEditingController();
  final tagController = TextEditingController();
  final racaController = TextEditingController();
  final nascimentoController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    tagController.dispose();
    racaController.dispose();
    nascimentoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final verde = const Color(0xFF435E20);
    final cinzaFundo = const Color(0xFFF4F5F4);
    final sombraCard = Colors.black.withOpacity(0.06);

    return Scaffold(
      backgroundColor: cinzaFundo,
      appBar: AppBar(
        title: const Text(
          'Meus animais',
          style: TextStyle(fontFamily: "MontserratBold"),
        ),
        backgroundColor: cinzaFundo,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Animais',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "MontserratBold",
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      itemCount: animais.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 24,
                            childAspectRatio: 0.9,
                          ),
                      itemBuilder: (context, index) {
                        final animal = animais[index];
                        final bool selecionado = animalSelecionado == animal;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              animalSelecionado = animal;
                              nomeController.text = animal['nome'] ?? '';
                              tagController.clear();
                              racaController.clear();
                              nascimentoController.clear();
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: selecionado
                                    ? verde.withOpacity(0.6)
                                    : Colors.transparent,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: sombraCard,
                                  blurRadius: 10,
                                  spreadRadius: 1,
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
                                    height: 140,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 14),
                                Text(
                                  animal['nome']!,
                                  style: TextStyle(
                                    fontSize: 16,
                                     fontFamily: "MontserratBold",
                                    color: selecionado ? verde : Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 12),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: animalSelecionado == null
                  ? Container(
                      key: const ValueKey('vazio'),
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.pets_rounded,
                              size: 80,
                              color: verde.withOpacity(0.3),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Selecione um animal',
                              style: TextStyle(
                                fontSize: 22,
                                 fontFamily: "MontserratBold",
                                color: verde.withOpacity(0.8),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Clique em um dos cartões ao lado para ver os detalhes',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                 fontFamily: "MontserratRegular",
                                fontSize: 15,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      key: const ValueKey('detalhes'),
                      color: Colors.white,
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                animalSelecionado!['nome']!,
                                style: TextStyle(
                                  fontSize: 28,
                                   fontFamily: "MontserratBold",
                                  color: verde,
                                ),
                              ),
                              IconButton(
                                onPressed: () =>
                                    setState(() => animalSelecionado = null),
                                icon: const Icon(Icons.close_rounded, size: 28),
                                color: Colors.grey.shade600,
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              animalSelecionado!['imagem']!,
                              height: 220,
                              width: 220,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 28),
                          _buildField(nomeController, 'Nome', verde),
                          const SizedBox(height: 14),
                          _buildField(tagController, 'Tag', verde),
                          const SizedBox(height: 14),
                          _buildField(racaController, 'Raça', verde),
                          const SizedBox(height: 14),
                          _buildField(
                            nascimentoController,
                            'Data de nascimento',
                            verde,
                            context,
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const VacinaScreen(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.vaccines_rounded),
                                  label: const Text('Vacinas'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: verde,
                                    foregroundColor: Colors.white,
                                    
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                       fontFamily: "MontserratBold",
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () =>
                                      setState(() => animalSelecionado = null),
                                  icon: const Icon(Icons.save),
                                  label: const Text('Salvar'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: verde,
                                    side: BorderSide(color: verde, width: 2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                       fontFamily: "MontserratBold",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(
    TextEditingController controller,
    String label,
    Color cor, [
    BuildContext? context,
  ]) {
    return TextField(
      controller: controller,
      readOnly: label == 'Data de nascimento',
      onTap: label == 'Data de nascimento'
          ? () async {
              FocusScope.of(context!).requestFocus(FocusNode());
              DateTime? data = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1990),
                lastDate: DateTime(2030),
              );
              if (data != null) {
                controller.text = '${data.day}/${data.month}/${data.year}';
              }
            }
          : null,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: cor, fontWeight: FontWeight.w500),
        filled: true,
        fillColor: const Color(0xFFF9F9F9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: cor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
      ),
    );
  }
}
