import 'package:auto_net/components/atn_contract.dart';
import 'package:auto_net/components/my_contract.dart';
import 'package:auto_net/components/new_project.dart';
import 'package:auto_net/services/providers.dart';
import 'package:auto_net/utils/common.dart';
import 'package:auto_net/utils/mock.dart';
import 'package:auto_net/utils/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web3dart/web3dart.dart';

const _divider = Divider(
  color: Colors.transparent,
  height: 20,
);

class MyAssets extends HookWidget {
  const MyAssets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final userAddress = useState(ethereum?.selectedAddress ?? _addrError);
    final useUser = useProvider(userProvider);

    if (!useProvider(isSignedInProvider).state && kReleaseMode) {
      return page403;
    }

    // useUser.state.web3sign();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child:
            useUser.state.user == null
                ? const Text('No contracts found')
                : MyContractView(),
        ),
      
    );
  }
}
