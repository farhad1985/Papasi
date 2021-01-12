class TransactionHistoryQuery {
  static var transactionHisotry = """
    query (\$page: Int) {
    findAllTransaction(query: {pagination: {page: \$page}}) {
        data {
          _id
          name
          jv {
            firstName
          }
          voucher {
            name
            description
            price
            startDate
            endDate
            typeName
            voucherType
            currency
            discountPercent
            discountAmount
          }
        }
      }
    }
  """;
}
