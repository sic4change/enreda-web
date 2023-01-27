import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:enreda_app/presentation/pages/resources/sections/build_share_button.dart';
import 'package:enreda_app/presentation/pages/resources/sections/show_alert_user_anonimous.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../models/contact.dart';
import '../../../../models/resource.dart';
import '../../../../services/database.dart';
import '../../../../utils/const.dart';
import '../../../../values/values.dart';
import '../../../layout/adaptive.dart';
import '../../../widgets/dialogs/show_alert_dialog.dart';
import '../../../widgets/dialogs/show_exception_alert_dialog.dart';
import '../../../widgets/spaces.dart';
import '../../../widgets/widgets/precache_widgets.dart';

class ResourceListTile extends StatefulWidget {
  const ResourceListTile({Key? key, required this.resource, this.onTap})
      : super(key: key);
  final Resource resource;
  final VoidCallback? onTap;

  @override
  _ResourceListTileState createState() => _ResourceListTileState();
}

class _ResourceListTileState extends State<ResourceListTile> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _name;
  String? _text;

  @override
  void initState() {
    super.initState();
    _email = "";
    _name = "";
    _text = "";
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 15, 15, md: 13);
    double sidePadding = responsiveSize(context, 15, 20, md: 17);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: const EdgeInsets.all(5.0),
          child:  InkWell(
            mouseCursor: MaterialStateMouseCursor.clickable,
            onTap: widget.onTap,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.violetBlue, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                      color: Colors.white,
                    ),
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                          ),
                          height: 60,
                          child: Padding(
                            padding: EdgeInsets.only(left: sidePadding, right: sidePadding, top: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                widget.resource.organizerImage == null || widget.resource.organizerImage!.isEmpty ? Container() :
                                LayoutBuilder(builder: (context, constraints) {
                                  return
                                    CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Constants.white,
                                    backgroundImage: NetworkImage(widget.resource.organizerImage!),
                                  );
                                }),
                                widget.resource.organizerImage == null || widget.resource.organizerImage!.isEmpty ? Container() : SizedBox(width: 5,),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.resource.promotor != null
                                            ? widget.resource.promotor!
                                            : widget.resource.organizerName ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: textTheme.bodyText1?.copyWith(
                                          color: AppColors.greyTxtAlt,
                                          height: 1.5,
                                          fontWeight: FontWeight.w400,
                                          fontSize: fontSize,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.place,
                                            color: AppColors.greyTxtAlt,
                                            size: 12,),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  widget.resource.countryName != null
                                                      ? widget.resource.countryName!
                                                      : widget.resource.countryName ?? '',
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: textTheme.bodyText1?.copyWith(
                                                    color: AppColors.greyTxtAlt,
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: fontSize,
                                                  ),
                                                ),
                                                Text(','),
                                                Text(
                                                  widget.resource.provinceName != null
                                                      ? widget.resource.provinceName!
                                                      : widget.resource.provinceName ?? '',
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: textTheme.bodyText1?.copyWith(
                                                    color: AppColors.greyTxtAlt,
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: fontSize,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      PopupMenuButton<int>(
                                        onSelected: (int value) {
                                          _displayReportDialog(context, widget.resource);
                                        },
                                        itemBuilder: (context) {
                                          return List.generate(1, (index) {
                                            return PopupMenuItem(
                                              value: 1,
                                              child: Text('Denunciar el recurso',
                                                  style: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontSize: 16,
                                                  )),
                                            );
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Icon(Icons.more_vert,
                                                color: AppColors.greyTxtAlt,
                                            size: 20,),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SpaceH4(),
                        Container(
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SpaceH8(),
                              Padding(
                                padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
                                child: Text(
                                  widget.resource.resourceTypeName!.toUpperCase(),
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  style: TextStyle(
                                      letterSpacing: 1.1,
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.darkViolet),
                                ),
                              ),
                              SpaceH4(),
                              Padding(
                                padding: EdgeInsets.only(right: sidePadding, left: sidePadding),
                                child: Text(
                                  widget.resource.title,
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  style: TextStyle(
                                    letterSpacing: 1.1,
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.bluePurple,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: widget.resource.resourcePhoto == null ||
                          widget.resource.resourcePhoto == ""
                          ? Container()
                          : PrecacheResourceCard(
                        imageUrl: widget.resource.resourcePhoto!,
                      )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                      color: AppColors.white,
                    ),
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: sidePadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: FaIcon(FontAwesomeIcons.heart),
                                tooltip: 'Me gusta',
                                color: AppColors.greyTxtAlt,
                                iconSize: 20,
                                onPressed: () => showAlertUserAnonimous(context),
                              ),
                            ],
                          ),
                          Spacer(),
                          buildShareButton(context, widget.resource, AppColors.greyTxtAlt),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _displayReportDialog(BuildContext context, Resource resource) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Denunciar recurso'),
            content: _buildForm(context, resource),
          );
        });
  }

  Widget _buildForm(BuildContext context, Resource resource) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 500,
          height: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildFormChildren(context, resource),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFormChildren(BuildContext context, Resource resource) {
    return [
      Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
                decoration: InputDecoration(labelText: 'Nombre'),
                initialValue: '',
                validator: (value) =>
                value!.isNotEmpty ? null : 'El nombre no puede estar vacío',
                onSaved: (value) => _name = value,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.name),
            TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                initialValue: _email,
                validator: (value) => EmailValidator.validate(value!) ? null : "El email no es válido",
                onSaved: (value) => _email = value,
                keyboardType: TextInputType.emailAddress),
            TextFormField(
                decoration: InputDecoration(labelText: 'Descripción de la denuncia'),
                initialValue: _text,
                validator: (value) =>
                value!.isNotEmpty ? null : 'La descripción no puede estar vacía',
                onSaved: (value) => _text = value,
                minLines: 4,
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.multiline),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    child: Text(StringConst.CANCEL, style: TextStyle(
                        color: AppColors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.normal)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                SpaceW20(),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    child: Text(StringConst.SEND, style: TextStyle(
                        color: AppColors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.normal)),
                    onPressed: () => _submit(resource),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
          ])
    ];
  }
  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit(Resource resource) async {
    if (_validateAndSaveForm()) {
      final contact = Contact(
        email: _email!,
        name: _name!,
        text: 'Tenemos una queja de este recurso: ${resource.title}.  ${_text!}',
      );
      try {
        final database = Provider.of<Database>(context, listen: false);
        await database.addContact(contact);
        showAlertDialog(
          context,
          title: 'Mensaje enviado',
          content: 'Hemos recibido satisfactoriamente tu mensaje, nos comunicaremos contigo a la brevedad.',
          defaultActionText: 'Ok',
        ).then((value) => Navigator.pop(context));
      } on FirebaseException catch (e) {
        showExceptionAlertDialog(context,
            title: 'Error al enviar contacto', exception: e).then((value) => Navigator.pop(context));;
      }
    }
  }

}