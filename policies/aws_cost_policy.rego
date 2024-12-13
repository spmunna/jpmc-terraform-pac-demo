package main

sum_project_costs(projects) = total {
    total := sum({to_number(p.breakdown.totalMonthlyCost) | p = projects[_]})
}

deny[msg] {
    total_monthly_cost := sum_project_costs(input.projects)
    total_monthly_cost > 1000
    msg = sprintf("Total monthly cost of $%.2f exceeds the $1000 limit.", [total_monthly_cost])
}

deny[msg] {
    past_total_monthly_cost := sum_project_costs(input.projects[_].pastBreakdown)
    current_total_monthly_cost := sum_project_costs(input.projects)
    cost_increase := current_total_monthly_cost - past_total_monthly_cost
    cost_increase > 500
    msg = sprintf("The increase in infrastructure cost of $%.2f exceeds the maximum allowed increase of $500.", [cost_increase])
}
