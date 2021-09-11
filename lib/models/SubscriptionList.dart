class SubscriptionList {
  List<PlanData> data;
  String message;
  int status;
  String selectedPlan;
  String cancelSelectedId;
  String errors;
  SubscriptionList(
      {this.data,
        this.message,
        this.status,
        this.selectedPlan,
        this.cancelSelectedId});

  SubscriptionList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<PlanData>();
      json['data'].forEach((v) {
        data.add(new PlanData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
    selectedPlan = json['selected_plan'];
    cancelSelectedId = json['cancel_selected_id'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    data['selected_plan'] = this.selectedPlan;
    data['cancel_selected_id'] = this.cancelSelectedId;
    return data;
  }
}


class PlanData {
  String id;
  String object;
  bool active;
  int amount;
  String amountDecimal;
  String billingScheme;
  int created;
  String currency;
  String interval;
  int intervalCount;
  bool livemode;
  String name;
  String nickname;
  String product;
  String statementDescriptor;
  String tiers;
  String tiersMode;
  String transformUsage;
  int trialPeriodDays;
  String usageType;

  PlanData(
      {this.id,
        this.object,
        this.active,
        this.amount,
        this.amountDecimal,
        this.billingScheme,
        this.created,
        this.currency,
        this.interval,
        this.intervalCount,
        this.livemode,
        this.name,
        this.nickname,
        this.product,
        this.statementDescriptor,
        this.tiers,
        this.tiersMode,
        this.transformUsage,
        this.trialPeriodDays,
        this.usageType});

  PlanData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    active = json['active'];
    amount = json['amount'];
    amountDecimal = json['amount_decimal'];
    billingScheme = json['billing_scheme'];
    created = json['created'];
    currency = json['currency'];
    interval = json['interval'];
    intervalCount = json['interval_count'];
    livemode = json['livemode'];
    name = json['name'];
    nickname = json['nickname'];
    product = json['product'];
    statementDescriptor = json['statement_descriptor'];
    tiers = json['tiers'];
    tiersMode = json['tiers_mode'];
    transformUsage = json['transform_usage'];
    trialPeriodDays = json['trial_period_days'];
    usageType = json['usage_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['active'] = this.active;
    data['amount'] = this.amount;
    data['amount_decimal'] = this.amountDecimal;
    data['billing_scheme'] = this.billingScheme;
    data['created'] = this.created;
    data['currency'] = this.currency;
    data['interval'] = this.interval;
    data['interval_count'] = this.intervalCount;
    data['livemode'] = this.livemode;
    data['name'] = this.name;
    data['nickname'] = this.nickname;
    data['product'] = this.product;
    data['statement_descriptor'] = this.statementDescriptor;
    data['tiers'] = this.tiers;
    data['tiers_mode'] = this.tiersMode;
    data['transform_usage'] = this.transformUsage;
    data['trial_period_days'] = this.trialPeriodDays;
    data['usage_type'] = this.usageType;
    return data;
  }
}























class VerifyCouponDetail
{
  String errors;
  int status;
  String message;
  SubscriptionListDetail data;
  VerifyCouponDetail({this.errors, this.status});

  VerifyCouponDetail.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    message = json['message'];
    status = json['status'];
    if (json['data'] != null && json['data'].length > 0) {
      data = SubscriptionListDetail.fromJson(json['data']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    data['status'] = this.status;
    return data;
  }
}
class SubscriptionListDetail
{
/*  "id": "price_1HrIu2GuGDDEAJ3QBMKLsN74",
  "object": "plan",
  "active": true,
  "aggregate_usage": null,
  "amount": 66900,
  "amount_decimal": "66900",
  "billing_scheme": "per_unit",
  "created": 1606291142,
  "currency": "inr",
  "interval": "month",
  "interval_count": 1,
  "livemode": false,
  "metadata": [],
  "name": "Team Lite",
  "nickname": null,
  "product": "prod_ISDKUINfS9dOAk",
  "statement_descriptor": null,
  "tiers": null,
  "tiers_mode": null,
  "transform_usage": null,
  "trial_period_days": 1,
  "usage_type": "licensed"*/

  String id;
  String object;
  bool active;
  String aggregate_usage;
  int amount;
  String amount_decimal;
  String billing_scheme;
  String created;
  String currency;
  String interval;
  String interval_count;
  bool livemode;
  String name;
  String nickname;
  String product;
  String statement_descriptor;
  String trial_period_days;
  String usage_type;
  double discount=0.0;
  double discountprize = 0.0;
  double finalprize = 0.0;
  String appliedcoupon="";

  SubscriptionListDetail({this.id, this.object,this.active,this.aggregate_usage,this.amount,this.amount_decimal,this.billing_scheme,this.created,this.currency,this.interval,this.interval_count,
  this.livemode,this.name,this.nickname,this.product,this.statement_descriptor,this.trial_period_days,this.usage_type,this.discount,this.finalprize,this.discountprize,this.appliedcoupon
  });

  SubscriptionListDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    active = json['active'];
    aggregate_usage = json['aggregate_usage'].toString();
    amount = json['amount'];
    amount_decimal = json['amount_decimal'];
    billing_scheme = json['billing_scheme'];
    created = json['created'].toString();
    currency = json['currency'];
    interval = json['interval'];
    interval_count = json['interval_count'].toString();
    livemode = json['livemode'];
    name = json['name'];
    nickname = json['nickname'];
    product = json['product'];
    statement_descriptor = json['statement_descriptor'];
    trial_period_days = json['trial_period_days'].toString();
    usage_type = json['usage_type'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;

    return data;
  }
}
