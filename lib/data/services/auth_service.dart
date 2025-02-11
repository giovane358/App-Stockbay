import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockbay/domain/models/user_models.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8080"));

  // Logar com um user na existente
  Future<User?> login(String login, String password) async {
    try {
      Response response = await _dio.post('/auth/login', data: {
        "login": login,
        "password": password,
      });

      // Verificar se o User foi logado
      if (response.statusCode == 200) {
        //Criando um novo usuario
        User user = User.fromJson(response.data);

        //Salvando token
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', user.token);

        return user;
      }
    } catch (e) {
      print("Erro ao fazer o login: $e");
    }
    return null;
  }

  // Criar um novo user
  Future<String?> register(String login, String password) async {
    try {
      Response response = await _dio.post('/auth/register', data: {
        "login": login,
        "password": password,
      });

      // Verificar se o User foi criado
      if (response.statusCode == 200) {
        //Criando um novo usuario

        return "Usuario de bom";
      }
    } catch (e) {
      print("Erro ao fazer o login: $e");
    }
    return null;
  }

  Future<bool> checkLogin() async {
    // Lógica para verificar se o usuário está logado
    // Por exemplo, checar o token armazenado no SharedPreferences
    String? token =
        await getToken(); // A função getToken pode ser um exemplo de como você verifica o token
    return token !=
        null; // Retorna true se o token existir, significa que o usuário está logado
  }

  //Remover o Token
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  // Pegar o Token
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
