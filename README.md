# AD-GroupAnalyzer
A tool written in PowerShell to analyze and compare security group memberships of two AD users. Streamlines auditing and ensures consistent user permissions.
Security Group User Comparisons Tool

## About
A tool written in PowerShell to analyze and compare security group memberships of two AD users. This utility streamlines the auditing process and ensures consistent user permissions across the board.

## Prerequisites
**Active Directory Module:** Ensure the Active Directory module is installed and available on your system. The script will automatically load this module.

### To install the Active Directory PowerShell module, you can use one of the following methods:
*Using the Control Panel
    *Open the Control Panel.
    *Go to Programs and Features.
    *Click Turn Windows features on or off.
    *Expand Remote Server Administration Tools.
    *Expand Role Administration Tools.
    *Expand AD DS and AD LDS Tools.
    *Select Active Directory Module for Windows PowerShell.
    *Click OK.
    
*Using PowerShell
    *Open PowerShell.
    *Type the following command:
    
    ```powershell
    Install-Module ActiveDirectory
    ```

*Using the Microsoft Store
    *Open the Microsoft Store.
    *Search for "Active Directory PowerShell module".
    *Click Install.
    
### Once the module is installed, you can start using it to manage your Active Directory environment.

## How to Use
1. **Run the Script:** Execute the security-group-user-comparisons.ps1 script in your PowerShell environment.
2. **Enter Usernames:** You will be prompted to input the usernames of two AD users you wish to compare.
3. **Choose an Option:** The script provides a menu with the following choices:
    - View groups that User1 is a member of, but User2 isn't.
    - View groups that User2 is a member of, but User1 isn't.
    - View groups that both users share.
4. **Exit the script**
    - View Results: Based on the option selected, the script will display the results on the console.

## Functionality Breakdown
- **Module Loading:** The script ensures the Active Directory module is loaded before proceeding.
- **Fetching Group Memberships:** Uses the Get-ADPrincipalGroupMembership cmdlet to fetch security groups for the provided AD usernames.
- **Comparison:** Utilizes the Compare-Object cmdlet to perform a comparison between the security groups of the two users.
- **User Interaction:** An intuitive menu is provided for users to select what type of comparison they want to view.

## Tips
Ensure the user account you're using to run the script has sufficient permissions to fetch group membership details from Active Directory.
Always review the results to verify the consistency of permissions.
