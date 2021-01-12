class ServiceGroupQuery {
  static var serviceGroup = """
      query {
        serviceGroups {
          name,
          iconURL,
          _id,
          totalServices,
          description,
        }
    }
  """;

  static var serviceByGroup = """
    query (\$serviceGroupId: String!, \$lat: Float, \$long: Float, \$cityId: String) {
        servicesByGroup(serviceGroupId: \$serviceGroupId,lat:\$lat, long: \$long, cityId: \$cityId, query: {
        pagination: {page:1, perPage:20}
        }
        ) {
            _id
            name
            estimatedDistance
            myRate
            totalReviews
            description
            address
            openTo
            isEnable
            lat
            long
            }
        }
    """;

  static var shopDetail = """
    query (\$id: String!){
      findOneService(id: \$id) {
        _id
        name
        phone
        address
        description
        recentVouchers {
          _id
          name
          typeName
          startDate
          endDate
          status
          description
          isGain
          isRedeem
          imageUrl
        }
        ratesAverage
        myRate
        ratesSummary {
            rate
            name
            count
          }
        totalReviews
      }
    }
    """;

  static var moreShope = """
      query (\$serviceId: String!){
        vouchersByService(serviceId: \$serviceId){
          _id
          name
          typeName
          startDate
          endDate
          status
          description
          isGain
          isRedeem
          imageUrl
        }
     }
    """;

  static var findOneVoucher = """
      query(\$id: String!) {
        findOneVoucher(id:\$id){
            _id
            name
            typeName
            startDate
            endDate
            status
            description
            imageUrl
            isGain
            isRedeem
            discountMethod
            voucherType
            usageCount
            details {
              name
              order
              discountAmount
              discountPercent
            }
        }
      }
    """;

  static var getQR = """
    query(\$isRedeem:Boolean!, \$voucherId:String!) {
      getQR(isRedeem: \$isRedeem, voucherId: \$voucherId) 
      }
    """;
}
