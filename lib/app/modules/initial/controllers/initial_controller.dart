import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test_tyba/app/data/models/user.dart';
import 'package:test_tyba/app/modules/initial/providers/credential_api.dart';
import 'package:test_tyba/app/routes/app_pages.dart';

class InitialController extends GetxController {
  late final GetStorage box;
  late CredentialAPI api;

  final form = FormGroup({
    'email': FormControl<String>(
        value: '', validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(
        value: '', validators: [Validators.required, Validators.minLength(8)]),
  });

  final RxInt _state = 0.obs;
  int get state => _state.value;
  set state(int value) => _state.value = value;

  login() async {
    final user = User(
        email: form.control('email').value,
        password: form.control('password').value);
    final response = await api.loginUser(user: user);
    await credentialsVerification(response);
  }

  register() async {
    final user = User(
        email: form.control('email').value,
        password: form.control('password').value);
    final response = await api.registerUser(user: user);
    await credentialsVerification(response);
  }

  credentialsVerification(User? user) {
    if (user != null) {
      box.write('token', user.id);
      Get.offAllNamed(AppPages.HOME);
    } else {
      Get.defaultDialog(
          title: 'Error',
          middleText: state == 0
              ? 'El usuario no existe o los datos estan incorrectos'
              : 'El usuario ya existe');
    }
  }

  @override
  void onInit() {
    super.onInit();
    box = GetStorage();
    api = CredentialAPI();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
