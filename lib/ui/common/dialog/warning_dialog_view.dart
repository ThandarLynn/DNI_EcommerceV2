import 'package:dni_ecommerce_v2/config/app_colors.dart';
import 'package:dni_ecommerce_v2/constant/ps_dimens.dart';
import 'package:dni_ecommerce_v2/utils/utils.dart';
import 'package:flutter/material.dart';

class WarningDialog extends StatefulWidget {
  const WarningDialog({this.message, this.onPressed});
  final String? message;
  final Function? onPressed;
  @override
  _WarningDialogState createState() => _WarningDialogState();
}

class _WarningDialogState extends State<WarningDialog> {
  @override
  Widget build(BuildContext context) {
    return _NewDialog(widget: widget);
  }
}

class _NewDialog extends StatelessWidget {
  const _NewDialog({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final WarningDialog widget;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                height: 60,
                width: double.infinity,
                padding: const EdgeInsets.all(AppDimens.space8),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    color: AppColors.mainColor),
                child: Row(
                  children: <Widget>[
                    const SizedBox(
                      width: AppDimens.space4,
                    ),
                    Icon(
                      Icons.warning,
                      color: AppColors.white,
                    ),
                    const SizedBox(
                      width: AppDimens.space4,
                    ),
                    Text(Utils.getString('warning_dialog__warning'),
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.white)),
                  ],
                )),
            const SizedBox(
              height: AppDimens.space20,
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: AppDimens.space16,
                  right: AppDimens.space16,
                  top: AppDimens.space8,
                  bottom: AppDimens.space8),
              child: Text(
                widget.message!,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(
              height: AppDimens.space20,
            ),
            Divider(
              thickness: 0.5,
              height: 1,
              color: Theme.of(context).iconTheme.color,
            ),
            MaterialButton(
              height: 50,
              minWidth: double.infinity,
              onPressed: () {
                Navigator.of(context).pop();
                widget.onPressed!();
              },
              child: Text(
                Utils.getString('dialog__ok'),
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: AppColors.mainColor),
              ),
            )
          ],
        ));
  }
}
