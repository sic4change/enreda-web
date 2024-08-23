import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:enreda_app/presentation/pages/resources/build_share_button.dart';
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: const EdgeInsets.all(5.0),
        child: InkWell(
          mouseCursor: MaterialStateMouseCursor.clickable,
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyTxtAlt.withOpacity(0.4), width: 1),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Constants.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyTxtAlt.withOpacity(0.4),
                    spreadRadius: 0.2,
                    blurRadius: 1,
                    offset: Offset(0, 0),
                  )
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 168,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: sidePadding, right: sidePadding, top: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              widget.resource.organizerImage == null ||
                                  widget.resource.organizerImage!.isEmpty
                                  ? Container()
                                  : LayoutBuilder(
                                  builder: (context, constraints) {
                                    return CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Constants.white,
                                      backgroundImage: NetworkImage(
                                          widget.resource.organizerImage!),
                                    );
                                  }),
                              widget.resource.organizerImage == null ||
                                  widget.resource.organizerImage!.isEmpty
                                  ? Container()
                                  : SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.resource.promotor?.isNotEmpty == true
                                          ? widget.resource.promotor!
                                          : widget.resource.organizerName ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: textTheme.bodySmall?.copyWith(
                                        color: Constants.grey,
                                        height: 1.5,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.place,
                                          color: Constants.grey,
                                          size: 12,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              getLocationText(widget.resource),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                              textTheme.bodySmall?.copyWith(
                                                color: Constants.grey,
                                                height: 1.5,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
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
                            ],
                          ),
                        ),
                      ),
                      SpaceH4(),
                      Container(
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SpaceH8(),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: sidePadding, right: sidePadding),
                              child: Text(
                                widget.resource.resourceCategoryName!
                                    .toUpperCase(),
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold,
                                    color: Constants.lilac),
                              ),
                            ),
                            SpaceH4(),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: sidePadding, left: sidePadding),
                              child: Text(
                                widget.resource.title,
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.penBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: sidePadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.greyTxtAlt, width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Constants.white
                            ),
                            child: Text(
                              'Ver más', style: TextStyle(
                              letterSpacing: 1,
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold,
                              color: AppColors.greyTxtAlt,
                            ),
                            )
                        ),
                        Spacer(),
                        buildShareButton(
                            context, widget.resource, Constants.grey),
                        SpaceW4(),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.heart),
                          tooltip: 'Me gusta',
                          color: AppColors.red,
                          iconSize: 20,
                          onPressed: () => showAlertUserAnonimous(context),
                        ),
                      ],
                    ),
                  ),
                )
              ],
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
            title: 'Error al enviar contacto', exception: e).then((value) => Navigator.pop(context));
      }
    }
  }

  String getLocationText(Resource resource) {
    switch (resource.modality) {
      case StringConst.FACE_TO_FACE:
      case StringConst.BLENDED:
        {
          if (resource.cityName != null) {
            return '${resource.cityName}, ${resource.provinceName}, ${resource.countryName}';
          }

          if (resource.cityName == null && resource.provinceName != null) {
            return '${resource.provinceName}, ${resource.countryName}';
          }

          if (resource.provinceName == null && resource.countryName != null) {
            return resource.countryName!;
          }

          if (resource.provinceName != null) {
            return resource.provinceName!;
          } else if (resource.countryName != null) {
            return resource.countryName!;
          }
          return resource.modality;
        }

      case StringConst.ONLINE_FOR_COUNTRY:
      /*return StringConst.ONLINE_FOR_COUNTRY
            .replaceAll('país', resource.countryName!);*/

      case StringConst.ONLINE_FOR_PROVINCE:
      /*return StringConst.ONLINE_FOR_PROVINCE.replaceAll(
            'provincia', '${resource.provinceName!}, ${resource.countryName!}');*/

      case StringConst.ONLINE_FOR_CITY:
      /*return StringConst.ONLINE_FOR_CITY.replaceAll('ciudad',
            '${resource.cityName!}, ${resource.provinceName!}, ${resource.countryName!}');*/

      case StringConst.ONLINE:
        return StringConst.ONLINE;

      default:
        return resource.modality;
    }
  }

}