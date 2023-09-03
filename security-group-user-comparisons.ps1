# Ensure the Active Directory module is loaded
Import-Module ActiveDirectory

# Prompt for usernames
$user1Name = Read-Host "Enter the username of User1"
$user2Name = Read-Host "Enter the username of User2"

# Get the security groups for both users
$user1Groups = Get-ADPrincipalGroupMembership $user1Name | Select-Object -ExpandProperty Name
$user2Groups = Get-ADPrincipalGroupMembership $user2Name | Select-Object -ExpandProperty Name

# Provide options to the user
$choice = $null
while ($choice -ne "4") {
    $choice = Read-Host "Choose an option:
    1. Groups that $user1Name has but $user2Name doesn't
    2. Groups that $user2Name has but $user1Name doesn't
    3. Groups that both users share
    4. Exit"

    switch ($choice) {
        "1" {
            $diff = Compare-Object -ReferenceObject $user1Groups -DifferenceObject $user2Groups | Where-Object { $_.SideIndicator -eq '<=' }
            if ($diff) {
                $diff | ForEach-Object { Write-Host "$($_.InputObject) is only in $user1Name's groups." }
            } else {
                Write-Host "$user1Name and $user2Name have the same groups."
            }
        }
        "2" {
            $diff = Compare-Object -ReferenceObject $user1Groups -DifferenceObject $user2Groups | Where-Object { $_.SideIndicator -eq '=>' }
            if ($diff) {
                $diff | ForEach-Object { Write-Host "$($_.InputObject) is only in $user2Name's groups." }
            } else {
                Write-Host "$user1Name and $user2Name have the same groups."
            }
        }
        "3" {
            $common = Compare-Object -ReferenceObject $user1Groups -DifferenceObject $user2Groups -ExcludeDifferent -IncludeEqual
            if ($common) {
                $common | ForEach-Object { Write-Host "$($_.InputObject) is shared by both users." }
            } else {
                Write-Host "There are no common groups between $user1Name and $user2Name."
            }
        }
        "4" {
            Write-Host "Exiting..."
        }
        default {
            Write-Host "Invalid choice. Please select a valid option."
        }
    }
}
