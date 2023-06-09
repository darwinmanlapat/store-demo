import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginTextField extends HookWidget {
  const LoginTextField(
      {this.obscureText = false,
      required this.keyboardType,
      required this.labelText,
      required this.onChanged,
      required this.inputText,
      this.inputFormatters,
      super.key});

  final bool obscureText;
  final String labelText;
  final String inputText;
  final TextInputType keyboardType;
  final void Function(String) onChanged;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final controller = useTextEditingController(text: '');
    final inputTextColor = useState(const Color(0xFF4A4A4A));

    useEffect(
      () {
        focusNode.addListener(() {
          if (focusNode.hasFocus) {
            inputTextColor.value = const Color(0xFF05B89D);
          } else {
            inputTextColor.value = const Color(0xFF4A4A4A);
          }
        });

        if (inputText.isEmpty) {
          controller.text = '';
        }
        return null;
      },
    );

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: inputTextColor.value,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Color(0xFF404453)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Color(0xFF05B89D),
          ),
        ),
      ),
      style: TextStyle(
        fontFamily: 'Clear Sans',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: inputTextColor.value,
      ),
    );
  }
}
