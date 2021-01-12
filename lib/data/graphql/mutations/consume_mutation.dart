class ConsumeMutation {
  static var consume = '''
        mutation consume(\$purchasedQuantity: Float, \$purchasedAmount: Float, \$isRedeem: Boolean!, \$voucherId: String!, \$jvId: String, \$clientId: String!) {
          register(input: {
            purchasedQuantity: \$purchasedQuantity,
            purchasedAmount: \$purchasedAmount,
            isRedeem: \$isRedeem,
            voucherId: \$voucherId,
            jvId: \$jvId,
            clientId: \$clientId,
          }) {
            enabled,
          }
        }
        ''';
}
