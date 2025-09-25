# 🔄 Dark Mode Toggle & Counter — Flutter

[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)](https://flutter.dev/)  
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

Este projeto demonstra o gerenciamento de estado no Flutter usando **ChangeNotifier** e **AnimatedBuilder** com dois exemplos práticos:

- **Dark Mode Toggle** → alternância entre tema claro e escuro usando AppController
- **Counter** → contador com incremento de valor usando setState local

---

## 🚀 Como rodar o projeto

```bash
# Clonar o repositório
git clone https://github.com/WarleyCoutinho/dark_mode_toggle.git

# Entrar na pasta do projeto
cd dark_mode_toggle

# Instalar dependências
flutter pub get

# Rodar no emulador ou dispositivo
flutter run
```

---

## 🏗️ Estrutura do Projeto

```
lib/
├── main.dart                           # Entry point da aplicação
├── app.dart                           # Widget principal com tema dinâmico
└── ui/
    ├── core/
    │   └── widgets/
    │       └── custom_dark_mode.dart   # Switch customizado
    └── features/
        └── presentation/
            └── home/
                ├── controllers/
                │   └── app_controller.dart  # Gerenciador de estado global
                └── screens/
                    └── home_page.dart      # Tela principal
```

---

## 📌 Implementação Atual

### 🔹 Gerenciador de Estado Global (AppController)

O projeto usa um **Singleton** com **ChangeNotifier** para gerenciar o tema globalmente:

```dart
class AppController extends ChangeNotifier {
  static AppController instance = AppController();
  bool isDartTheme = false;

  changeTheme() {
    isDartTheme = !isDartTheme;
    notifyListeners();
  }
}
```

### 🔹 Widget Principal com AnimatedBuilder

```dart
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: AppController.instance.isDartTheme
                ? Brightness.dark
                : Brightness.light,
            ),
          ),
          home: const HomePage(title: 'Dark Mode Toggle'),
        );
      },
    );
  }
}
```

### 🔹 Switch Customizado

```dart
class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDartTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
```

### 🔹 Tela Principal com Estado Local

```dart
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [CustomSwitch()],
      ),
      body: Center(
        child: Text('Counter: $counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
```

---

## 🔀 Fluxo de Dados

### 🔹 Dark Mode (Estado Global)

```
[AppController.instance] ← Singleton global
    ↓
[CustomSwitch] → chama changeTheme()
    ↓
AppController.notifyListeners()
    ↓
[AnimatedBuilder] escuta e reconstrói a MaterialApp
    ↓
Novo tema é aplicado em toda a aplicação
```

### 🔹 Counter (Estado Local)

```
[_HomePageState] ← Estado local do widget
    ↓
FloatingActionButton.onPressed()
    ↓
setState(() => counter++)
    ↓
Widget reconstrói com novo valor
```

---

## 📋 Características da Implementação

| Componente    | Tipo de Estado | Escopo          | Gerenciamento                    |
| ------------- | -------------- | --------------- | -------------------------------- |
| **Dark Mode** | Global         | Toda a app      | ChangeNotifier + AnimatedBuilder |
| **Counter**   | Local          | HomePage apenas | StatefulWidget + setState        |

---

## ✨ Vantagens da Abordagem Atual

### ✅ ChangeNotifier + AnimatedBuilder:

- **Reatividade**: Interface atualiza automaticamente
- **Performance**: Reconstrói apenas widgets necessários
- **Simplicidade**: Fácil de implementar e entender
- **Escopo Global**: Theme acessível em toda aplicação

### ✅ Estado Local (setState):

- **Simplicidade**: Para estados específicos do widget
- **Performance**: Não impacta outros componentes
- **Isolamento**: Estado fica encapsulado

---

## 🔧 Possíveis Melhorias

Para projetos maiores, considere:

- **Provider** para injeção de dependência
- **SharedPreferences** para persistir preferências
- **BLoC/Cubit** para lógica de negócio complexa
- **Riverpod** para gerenciamento de estado avançado

---

## 📚 Tecnologias utilizadas

- **Flutter** 3.x
- **Dart**
- **Material Design** Components
- **ChangeNotifier** para gerenciamento de estado
- **AnimatedBuilder** para reatividade

---

## 🤝 Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para:

1. Fazer um fork do projeto
2. Criar uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abrir um Pull Request

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

## ✏️ Autor

**Warley Coutinho**

- GitHub: [@WarleyCoutinho](https://github.com/WarleyCoutinho)
- LinkedIn: [Warley Coutinho](https://www.linkedin.com/in/coutinho-warley/)

---

## 🌟 Mostre seu apoio

Se este projeto te ajudou, deixe uma ⭐ no repositório!
