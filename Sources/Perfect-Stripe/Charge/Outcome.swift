//
//  Outcome.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-16.
//
//

public class StripeChargeOutcome {

	/// Possible values are approved_by_network, declined_by_network, not_sent_to_network, and reversed_after_approval. The value reversed_after_approval indicates the payment was blocked by Stripe after bank authorization, and may temporarily appear as “pending” on a cardholder’s statement
	public var network_status: StripeChargeNetworkStatus = .approved_by_network

	/// An enumerated value indicating a more detailed explanation of the outcome’s type. See understanding declines for details.
	public var reason: StripeErrorCode = .none

	/// Stripe’s evaluation of the riskiness of the payment. Possible values for evaluated payments are normal, elevated, highest. For non-card payments, and card-based payments predating the public assignment of risk levels, this field will have the value not_assessed. In the event of an error in the evaluation, this field will have the value unknown.
	public var risk_level: StripeRiskLevel = .not_assessed

	/// The ID of the Radar rule that matched the payment.
	public var rule = ""

	/// A human-readable description of the outcome type and reason, designed for you (the recipient of the payment), not your customer.
	public var seller_message = ""

	/// Possible values are authorized, manual_review, issuer_declined, blocked, and invalid. See understanding declines and Radar reviews for details.
	public var type: StripeChargeType = .authorized

}


public enum StripeChargeNetworkStatus {
	case approved_by_network, declined_by_network, not_sent_to_network, reversed_after_approval
}

public enum StripeRiskLevel {
	case normal, elevated, highest, not_assessed, unknown
}

public enum StripeChargeType {
	case authorized, manual_review, issuer_declined, blocked, invalid
}

