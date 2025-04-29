import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flag/flag.dart';

class CountryOption {
  final String name;
  final String countryCode;
  const CountryOption({required this.name, required this.countryCode});
}

class CountrySelectionScreen extends StatefulWidget {
  const CountrySelectionScreen({super.key});

  @override
  State<CountrySelectionScreen> createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  String? selectedCountry;
  final TextEditingController _searchController = TextEditingController();
  List<CountryOption> filteredCountries = [];
  
  final List<CountryOption> countries = [
    const CountryOption(name: "Afghanistan", countryCode: "AF"),
    const CountryOption(name: "Albania", countryCode: "AL"),
    const CountryOption(name: "Algeria", countryCode: "DZ"),
    const CountryOption(name: "Andorra", countryCode: "AD"),
    const CountryOption(name: "Angola", countryCode: "AO"),
    const CountryOption(name: "Antigua and Barbuda", countryCode: "AG"),
    const CountryOption(name: "Argentina", countryCode: "AR"),
    const CountryOption(name: "Armenia", countryCode: "AM"),
    const CountryOption(name: "Australia", countryCode: "AU"),
    const CountryOption(name: "Austria", countryCode: "AT"),
    const CountryOption(name: "Azerbaijan", countryCode: "AZ"),
    const CountryOption(name: "Bahamas", countryCode: "BS"),
    const CountryOption(name: "Bahrain", countryCode: "BH"),
    const CountryOption(name: "Bangladesh", countryCode: "BD"),
    const CountryOption(name: "Barbados", countryCode: "BB"),
    const CountryOption(name: "Belarus", countryCode: "BY"),
    const CountryOption(name: "Belgium", countryCode: "BE"),
    const CountryOption(name: "Belize", countryCode: "BZ"),
    const CountryOption(name: "Benin", countryCode: "BJ"),
    const CountryOption(name: "Bhutan", countryCode: "BT"),
    const CountryOption(name: "Bolivia", countryCode: "BO"),
    const CountryOption(name: "Bosnia and Herzegovina", countryCode: "BA"),
    const CountryOption(name: "Botswana", countryCode: "BW"),
    const CountryOption(name: "Brazil", countryCode: "BR"),
    const CountryOption(name: "Brunei", countryCode: "BN"),
    const CountryOption(name: "Bulgaria", countryCode: "BG"),
    const CountryOption(name: "Burkina Faso", countryCode: "BF"),
    const CountryOption(name: "Burundi", countryCode: "BI"),
    const CountryOption(name: "Cambodia", countryCode: "KH"),
    const CountryOption(name: "Cameroon", countryCode: "CM"),
    const CountryOption(name: "Canada", countryCode: "CA"),
    const CountryOption(name: "Cape Verde", countryCode: "CV"),
    const CountryOption(name: "Central African Republic", countryCode: "CF"),
    const CountryOption(name: "Chad", countryCode: "TD"),
    const CountryOption(name: "Chile", countryCode: "CL"),
    const CountryOption(name: "China", countryCode: "CN"),
    const CountryOption(name: "Colombia", countryCode: "CO"),
    const CountryOption(name: "Comoros", countryCode: "KM"),
    const CountryOption(name: "Congo", countryCode: "CG"),
    const CountryOption(name: "Costa Rica", countryCode: "CR"),
    const CountryOption(name: "Croatia", countryCode: "HR"),
    const CountryOption(name: "Cuba", countryCode: "CU"),
    const CountryOption(name: "Cyprus", countryCode: "CY"),
    const CountryOption(name: "Czech Republic", countryCode: "CZ"),
    const CountryOption(name: "Denmark", countryCode: "DK"),
    const CountryOption(name: "Djibouti", countryCode: "DJ"),
    const CountryOption(name: "Dominica", countryCode: "DM"),
    const CountryOption(name: "Dominican Republic", countryCode: "DO"),
    const CountryOption(name: "East Timor", countryCode: "TL"),
    const CountryOption(name: "Ecuador", countryCode: "EC"),
    const CountryOption(name: "Egypt", countryCode: "EG"),
    const CountryOption(name: "El Salvador", countryCode: "SV"),
    const CountryOption(name: "Equatorial Guinea", countryCode: "GQ"),
    const CountryOption(name: "Eritrea", countryCode: "ER"),
    const CountryOption(name: "Estonia", countryCode: "EE"),
    const CountryOption(name: "Ethiopia", countryCode: "ET"),
    const CountryOption(name: "Fiji", countryCode: "FJ"),
    const CountryOption(name: "Finland", countryCode: "FI"),
    const CountryOption(name: "France", countryCode: "FR"),
    const CountryOption(name: "Gabon", countryCode: "GA"),
    const CountryOption(name: "Gambia", countryCode: "GM"),
    const CountryOption(name: "Georgia", countryCode: "GE"),
    const CountryOption(name: "Germany", countryCode: "DE"),
    const CountryOption(name: "Ghana", countryCode: "GH"),
    const CountryOption(name: "Greece", countryCode: "GR"),
    const CountryOption(name: "Grenada", countryCode: "GD"),
    const CountryOption(name: "Guatemala", countryCode: "GT"),
    const CountryOption(name: "Guinea", countryCode: "GN"),
    const CountryOption(name: "Guinea-Bissau", countryCode: "GW"),
    const CountryOption(name: "Guyana", countryCode: "GY"),
    const CountryOption(name: "Haiti", countryCode: "HT"),
    const CountryOption(name: "Honduras", countryCode: "HN"),
    const CountryOption(name: "Hungary", countryCode: "HU"),
    const CountryOption(name: "Iceland", countryCode: "IS"),
    const CountryOption(name: "India", countryCode: "IN"),
    const CountryOption(name: "Indonesia", countryCode: "ID"),
    const CountryOption(name: "Iran", countryCode: "IR"),
    const CountryOption(name: "Iraq", countryCode: "IQ"),
    const CountryOption(name: "Ireland", countryCode: "IE"),
    const CountryOption(name: "Israel", countryCode: "IL"),
    const CountryOption(name: "Italy", countryCode: "IT"),
    const CountryOption(name: "Jamaica", countryCode: "JM"),
    const CountryOption(name: "Japan", countryCode: "JP"),
    const CountryOption(name: "Jordan", countryCode: "JO"),
    const CountryOption(name: "Kazakhstan", countryCode: "KZ"),
    const CountryOption(name: "Kenya", countryCode: "KE"),
    const CountryOption(name: "Kiribati", countryCode: "KI"),
    const CountryOption(name: "Korea, North", countryCode: "KP"),
    const CountryOption(name: "Korea, South", countryCode: "KR"),
    const CountryOption(name: "Kuwait", countryCode: "KW"),
    const CountryOption(name: "Kyrgyzstan", countryCode: "KG"),
    const CountryOption(name: "Laos", countryCode: "LA"),
    const CountryOption(name: "Latvia", countryCode: "LV"),
    const CountryOption(name: "Lebanon", countryCode: "LB"),
    const CountryOption(name: "Lesotho", countryCode: "LS"),
    const CountryOption(name: "Liberia", countryCode: "LR"),
    const CountryOption(name: "Libya", countryCode: "LY"),
    const CountryOption(name: "Liechtenstein", countryCode: "LI"),
    const CountryOption(name: "Lithuania", countryCode: "LT"),
    const CountryOption(name: "Luxembourg", countryCode: "LU"),
    const CountryOption(name: "Macedonia", countryCode: "MK"),
    const CountryOption(name: "Madagascar", countryCode: "MG"),
    const CountryOption(name: "Malawi", countryCode: "MW"),
    const CountryOption(name: "Malaysia", countryCode: "MY"),
    const CountryOption(name: "Maldives", countryCode: "MV"),
    const CountryOption(name: "Mali", countryCode: "ML"),
    const CountryOption(name: "Malta", countryCode: "MT"),
    const CountryOption(name: "Marshall Islands", countryCode: "MH"),
    const CountryOption(name: "Mauritania", countryCode: "MR"),
    const CountryOption(name: "Mauritius", countryCode: "MU"),
    const CountryOption(name: "Mexico", countryCode: "MX"),
    const CountryOption(name: "Micronesia", countryCode: "FM"),
    const CountryOption(name: "Moldova", countryCode: "MD"),
    const CountryOption(name: "Monaco", countryCode: "MC"),
    const CountryOption(name: "Mongolia", countryCode: "MN"),
    const CountryOption(name: "Montenegro", countryCode: "ME"),
    const CountryOption(name: "Morocco", countryCode: "MA"),
    const CountryOption(name: "Mozambique", countryCode: "MZ"),
    const CountryOption(name: "Myanmar", countryCode: "MM"),
    const CountryOption(name: "Namibia", countryCode: "NA"),
    const CountryOption(name: "Nauru", countryCode: "NR"),
    const CountryOption(name: "Nepal", countryCode: "NP"),
    const CountryOption(name: "Netherlands", countryCode: "NL"),
    const CountryOption(name: "New Zealand", countryCode: "NZ"),
    const CountryOption(name: "Nicaragua", countryCode: "NI"),
    const CountryOption(name: "Niger", countryCode: "NE"),
    const CountryOption(name: "Nigeria", countryCode: "NG"),
    const CountryOption(name: "Norway", countryCode: "NO"),
    const CountryOption(name: "Oman", countryCode: "OM"),
    const CountryOption(name: "Pakistan", countryCode: "PK"),
    const CountryOption(name: "Palau", countryCode: "PW"),
    const CountryOption(name: "Panama", countryCode: "PA"),
    const CountryOption(name: "Papua New Guinea", countryCode: "PG"),
    const CountryOption(name: "Paraguay", countryCode: "PY"),
    const CountryOption(name: "Peru", countryCode: "PE"),
    const CountryOption(name: "Philippines", countryCode: "PH"),
    const CountryOption(name: "Poland", countryCode: "PL"),
    const CountryOption(name: "Portugal", countryCode: "PT"),
    const CountryOption(name: "Qatar", countryCode: "QA"),
    const CountryOption(name: "Romania", countryCode: "RO"),
    const CountryOption(name: "Russia", countryCode: "RU"),
    const CountryOption(name: "Rwanda", countryCode: "RW"),
    const CountryOption(name: "Saint Kitts and Nevis", countryCode: "KN"),
    const CountryOption(name: "Saint Lucia", countryCode: "LC"),
    const CountryOption(name: "Saint Vincent", countryCode: "VC"),
    const CountryOption(name: "Samoa", countryCode: "WS"),
    const CountryOption(name: "San Marino", countryCode: "SM"),
    const CountryOption(name: "Sao Tome and Principe", countryCode: "ST"),
    const CountryOption(name: "Saudi Arabia", countryCode: "SA"),
    const CountryOption(name: "Senegal", countryCode: "SN"),
    const CountryOption(name: "Serbia", countryCode: "RS"),
    const CountryOption(name: "Seychelles", countryCode: "SC"),
    const CountryOption(name: "Sierra Leone", countryCode: "SL"),
    const CountryOption(name: "Singapore", countryCode: "SG"),
    const CountryOption(name: "Slovakia", countryCode: "SK"),
    const CountryOption(name: "Slovenia", countryCode: "SI"),
    const CountryOption(name: "Solomon Islands", countryCode: "SB"),
    const CountryOption(name: "Somalia", countryCode: "SO"),
    const CountryOption(name: "South Africa", countryCode: "ZA"),
    const CountryOption(name: "South Sudan", countryCode: "SS"),
    const CountryOption(name: "Spain", countryCode: "ES"),
    const CountryOption(name: "Sri Lanka", countryCode: "LK"),
    const CountryOption(name: "Sudan", countryCode: "SD"),
    const CountryOption(name: "Suriname", countryCode: "SR"),
    const CountryOption(name: "Swaziland", countryCode: "SZ"),
    const CountryOption(name: "Sweden", countryCode: "SE"),
    const CountryOption(name: "Switzerland", countryCode: "CH"),
    const CountryOption(name: "Syria", countryCode: "SY"),
    const CountryOption(name: "Taiwan", countryCode: "TW"),
    const CountryOption(name: "Tajikistan", countryCode: "TJ"),
    const CountryOption(name: "Tanzania", countryCode: "TZ"),
    const CountryOption(name: "Thailand", countryCode: "TH"),
    const CountryOption(name: "Togo", countryCode: "TG"),
    const CountryOption(name: "Tonga", countryCode: "TO"),
    const CountryOption(name: "Trinidad and Tobago", countryCode: "TT"),
    const CountryOption(name: "Tunisia", countryCode: "TN"),
    const CountryOption(name: "Turkey", countryCode: "TR"),
    const CountryOption(name: "Turkmenistan", countryCode: "TM"),
    const CountryOption(name: "Tuvalu", countryCode: "TV"),
    const CountryOption(name: "Uganda", countryCode: "UG"),
    const CountryOption(name: "Ukraine", countryCode: "UA"),
    const CountryOption(name: "United Arab Emirates", countryCode: "AE"),
    const CountryOption(name: "United Kingdom", countryCode: "GB"),
    const CountryOption(name: "United States", countryCode: "US"),
    const CountryOption(name: "Uruguay", countryCode: "UY"),
    const CountryOption(name: "Uzbekistan", countryCode: "UZ"),
    const CountryOption(name: "Vanuatu", countryCode: "VU"),
    const CountryOption(name: "Vatican City", countryCode: "VA"),
    const CountryOption(name: "Venezuela", countryCode: "VE"),
    const CountryOption(name: "Vietnam", countryCode: "VN"),
    const CountryOption(name: "Yemen", countryCode: "YE"),
    const CountryOption(name: "Zambia", countryCode: "ZM"),
    const CountryOption(name: "Zimbabwe", countryCode: "ZW"),
  ];

  @override
  void initState() {
    super.initState();
    filteredCountries = List.from(countries);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredCountries = countries.where((country) {
        return country.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Background gradient circles
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              right: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFB863F0).withOpacity(0.6),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFB863F0).withOpacity(0.3),
                      blurRadius: 150,
                      spreadRadius: 50,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -50,
              left: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF32CAF8).withOpacity(0.3),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF32CAF8).withOpacity(0.15),
                      blurRadius: 150,
                      spreadRadius: 50,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select country or Region',
                        style: GoogleFonts.figtree(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1D2939),
                        ),
                      ),
                      const SizedBox(height: 11),
                      Text(
                        'Available cloud services are based on the country and region you select.',
                        style: GoogleFonts.figtree(
                          fontSize: 16,
                          color: const Color(0xFF667085),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Material(
                    elevation: 1,
                    shadowColor: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search country',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 14,
                          color: const Color(0xFF98A2B3),
                          letterSpacing: -0.1,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFD0D5DD),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFD0D5DD),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F4F7),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          offset: const Offset(0, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: filteredCountries.length,
                      separatorBuilder: (context, index) => const Divider(
                        color: Color(0xFFEAECF0),
                        height: 1,
                        thickness: 1,
                      ),
                      itemBuilder: (context, index) {
                        final country = filteredCountries[index];
                        final isSelected = selectedCountry == country.name;
                        
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedCountry = country.name;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipOval(
                                      child: SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: Flag.fromString(
                                          country.countryCode,
                                          height: 24,
                                          width: 24,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      country.name,
                                      style: GoogleFonts.figtree(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF1D2939),
                                      ),
                                    ),
                                  ],
                                ),
                                _buildRadioButton(isSelected),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: selectedCountry != null
                        ? () {
                            // Navigate to next screen
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5339AD),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                      elevation: selectedCountry != null ? 1 : 0,
                      shadowColor: Colors.black.withOpacity(0.05),
                      disabledBackgroundColor: const Color(0xFF5339AD).withOpacity(0.5),
                    ),
                    child: Text(
                      'Continue',
                      style: GoogleFonts.figtree(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioButton(bool isSelected) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? const Color(0xFF231849) : const Color(0xFFD0D5DD),
          width: 1.5,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF231849),
                ),
              ),
            )
          : null,
    );
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }
}