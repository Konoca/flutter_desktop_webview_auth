import 'src/provider_args.dart';

const _defaultSignInScope = 'https://www.googleapis.com/auth/plus.login';

class GoogleSignInArgs extends ProviderArgs {
  final String clientId;
  final String scope;
  final bool immediate;
  final String responseType;
  final String accessType;
  final String prompt;
  final bool includeGrantedScopes;
  final String nonce;

  @override
  final String redirectUri;

  @override
  final host = 'accounts.google.com';

  @override
  final path = '/o/oauth2/v2/auth';

  GoogleSignInArgs({
    required this.clientId,
    required this.redirectUri,
    this.scope = _defaultSignInScope,
    this.immediate = false,
    this.responseType = 'code',
    this.accessType = 'online',
    this.prompt = 'select_account consent',
    this.includeGrantedScopes = false,
    this.nonce = '',
  });

  @override
  Map<String, String> buildQueryParameters() {
    return {
      'client_id': clientId,
      'scope': scope,
      if (prompt.isEmpty) 'immediate': immediate.toString(),
      'response_type': responseType,
      'redirect_uri': redirectUri,
      'access_type': accessType,
      if (prompt.isNotEmpty) 'prompt': prompt,
      'include_granted_scopes': includeGrantedScopes.toString(),
      if (nonce != '') 'nonce': nonce,
    };
  }
}
