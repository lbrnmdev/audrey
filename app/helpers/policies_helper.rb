module PoliciesHelper
  # return cell class depending on policy status
  def policy_table_cell_class policy
    if policy.expired?
      'negative'
    elsif (policy.not_issued? || policy.cancelled?)
      'warning'
    else
      'positive'
    end
  end

  # return cell popup content depending on policy status
  def policy_cell_pop_up policy
    if policy.expired?
      "Expired: " + policy.end_date.to_s(:rfc822)
    elsif policy.not_issued?
      "Not issued"
    elsif policy.cancelled?
      "Cancelled"
    else
      "Valid from " + policy.start_date.to_s(:rfc822) + " to " + policy.end_date.to_s(:rfc822)
    end
  end
end
