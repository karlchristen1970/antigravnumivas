import '../models/types.dart';

List<Unit> kUnits = [
  const Unit(
    id: 'vault-042',
    name: 'Vault Edition',
    location: 'Master Bedroom',
    coinCount: 12,
    temp: 72,
    humidity: 45,
    status: 'Secure',
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB3oJb4wjxbuPfuwXG0g7lpYdO5LhO6MfSGvybrlMkMoRD80V1ZCGWpYtmuBSNJ3b8mGvx14cRTqZqFcByK3rhSNRQCAXCxcN7mGKWZoSVAbhgP4S1BMZikwiybJgrMZFL_al9UVj5hc7JIl2uqJjgMMQa-pnWPjl-cxXehVx9dp8A5xH2b1qTfut4Ja1tlIC-VromI62h9G0RUIlX0Xi4UXFiqfoYTJyIbQaUaBEwA-Maza60pHIh3hUq4ReofxEI5YlWjJsNdlRM',
    slots: 12,
    description: 'Currently displaying the "Patriot Collection" featuring key dates from the 19th century. Security bolts engaged.',
  ),
  const Unit(
    id: 'classic-001',
    name: 'Classic Protect',
    location: 'Study',
    coinCount: 2,
    temp: 71,
    humidity: 42,
    status: 'Secure',
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBSj83UOdxkqIrD9o8IKrWWzD3jZfDRlOlv0Acb0v5O6NfOF2Rnpya-A4K11vWS5hoEeIzM2RdY8Y2Es4Yxq2HLM7Dts3LYhTsmbXkp5HDWRLCl1x1L4PE6RooHjisSZgR9rGoTUfsmv-Oa6EGDPhCqR3-bYgO6QrQgPi5hLHF4-oZKR6IkG98upEM_HAN2tbKgT-q1BSkw4F98irlh0bui92eHBEVTv1FBm6k7XD5QoN37xpeGz8UJCsORMVEeDpTpJfyD82zBS0U',
    slots: 2,
    description: 'Elegant dual-coin display perfect for focused collections. Features hidden compartment mechanics.',
  ),
  const Unit(
    id: 'collector-008',
    name: 'Collector Secure',
    location: 'Foyer',
    coinCount: 8,
    temp: 70,
    humidity: 44,
    status: 'Secure',
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD7xW7qxltjURTq27Nb6Ro67YnOBhYwsMR3I3Pjl1vBto5CkEFBntfOpcUASXCZnzCL2-48LDs7x1lF3Qos3z7POSlBfW5GJkk8YX2yR5kICbWbli7SvSPeynNth8axvcbVmHujeZceWMWqMhj10-bSDsIOoPwopu7rGwtKhowM8NAu-9dGRJXDgjk5i1EbiivK3DDKIrj9X1G8C-eu-HHDAgsWREiaiXzyPdDodN2RjyS6rUxAesd4BTRnyUwF_qT3x5FtRA_wpW8',
    slots: 8,
    description: 'Advanced 8-slot configuration for active sets. Biometric locking with lunar series backing art.',
  ),
];

List<Coin> kInventory = [
  const Coin(
    id: 'c1',
    name: '1933 Double Eagle',
    grade: 'MS65',
    metal: 'Gold',
    certNumber: '84729104',
    agency: 'PCGS',
    value: 75000,
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBDafIUdBcPGTbpbShWa8Ubw1SBCB7meElYLMc9cklOgyjeOm5qc_j86NCNKLNxaac42PgtCkvc_jfSFLGLPne19B8_CTXJolBvTtH1_2Lx7f8MQV97xPHxL4KNI13sFgt1RjYmj0Yj9ePVMH131mombEoKiRaLpkGmN9M6bByr4Zwd6P9lkgRCDQkCOhMrVsWyW_2HdPKxa3BiNLabY5_4zQgJZ2UfxKT_YbL0IfDba68XVrHAblaHTyC75BbKCxcrfiMkDmNcZpQ',
  ),
  const Coin(
    id: 'c2',
    name: '1893-S Morgan Dollar',
    grade: 'MS63',
    metal: 'Silver',
    certNumber: '44210092',
    agency: 'NGC',
    value: 42000,
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDT8dyeObCNkUZPU7aRyiA9GvAtUhmsHc1ppbdfsFsq4gN4dwp-V4DwsQ-02wrGWi3FuWQl2Qnu0_7HR51H2pLyRtlD761fvnu6LGoH2ohU23ltrBxZBHSaCJvuCcLF-og5oNUIE_LH53EwqjDAZOZ7uPNn3K4rEhbsb_Vit5nHvMhQMjYW6sa29pLkPDz_lErTVjzlo8k6swBLc1jHytRe1IajWq_vNTkANs4Z0T3Xgc-5lhUY6YsUyXfPgUNWeOmbJzhyT-m4D_o',
  ),
  const Coin(
    id: 'c3',
    name: 'Roman Aureus',
    grade: 'Ch XF',
    metal: 'Ancient',
    certNumber: '19283745',
    agency: 'NGC',
    value: 15500,
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA0PG8cvsASFDOj2EZ3uSXjczJ16zXJT9I8bqwhUQH5gULAcb1C4sWIbVtfAicuox47jK5Gp5IvkYAaCP5ddLh1u_5FHvkRQvIurGDpRhddC8mgdELOmgeBImVs14ue70DfbuNsVeQt04UFwIB2cDeRP9n68A-k9oWDQDJxBiDp2Y9xMcWdr0jva54PqSOShrQddRBbT7oNk_b2m2dt22aeQ-7YhujMQlOcltuXZ3MRTSZ31OKFpQdUj1gy_kxhfaOvx4Sux6PqESA',
  ),
  const Coin(
    id: 'c4',
    name: '1907 High Relief',
    grade: 'MS66',
    metal: 'Gold',
    certNumber: '99821102',
    agency: 'PCGS',
    value: 10000,
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAMQk6vPlHOQP8gCTJNKdhUuYNPMR5kfmePdhK5LRgC8AjlMKD7krQph_RYEgCbfaJ0eA8hUnfGLkdTuKuuYL_-mKPNd1iEZjjr4_mYVrR3uZl5lqhdsxVeJ_E5W7CYj2bLNDfikaNimNSEWQhcPppZ8_r86nWlldczCSWkS61d18-XsYpYn1lNO3veAyYko7QVN-VDiRLesy2tCaHdolntl9_zJjgbHqHi59trNcmLYuornxxHqAfWGYctapDYy3SrOeA0hL_jG3A',
  ),
];

List<LogEntry> kLogs = [
  const LogEntry(id: 'l1', time: 'Today, 10:42 AM', event: 'Remote Unlock', status: 'Success', device: "John's iPhone 14"),
  const LogEntry(id: 'l2', time: 'Today, 09:15 AM', event: 'Vibration Alert', status: 'Resolved', device: "System Sensor"),
  const LogEntry(id: 'l3', time: 'Yesterday, 8:00 PM', event: 'Inventory Scan', status: 'Complete', device: "Automated Schedule"),
];

List<Partner> kPartners = [
  const Partner(id: 'p1', name: 'NumisGlobal', location: 'London, UK', description: 'Specializing in ancient Roman coinage and rare medieval artifacts.', initial: 'N'),
  const Partner(id: 'p2', name: 'GoldStandard', location: 'New York, USA', description: 'The premier authority on pre-1933 American Gold Eagles.', initial: 'G'),
  const Partner(id: 'p3', name: 'AsiaMint', location: 'Singapore', description: 'Exclusive access to rare eastern currencies and limited releases.', initial: 'A'),
];
