import 'package:bike_buddy2/Models/repair_content.dart';

//lib\Data\repair_content.dart
final Map<String, RepairSubtopic> allSubtopics = {
  'rigid_fork': RepairSubtopic(
    id: 1,
    title: 'Fork (Criterium/Rigid)',
    avatarPath: 'assets/innerIcon/rFork.png',
    description:
        'Standard rigid fork service and inspection for high-speed stability.',
    tools: ['4mm & 5mm Allen keys', 'Water-resistant Grease', 'Microfiber Rag'],
    steps: [
      'Thoroughly clean the fork blades and crown to inspect for hairline cracks or paint chips.',
      'Check Headset Play: Hold the front brake and rock the bike back and forth; feel for clicks in the headtube.',
      'Loosen stem bolts, tighten the top cap until play disappears, then re-align and torque stem bolts.',
      'Verify that the front wheel quick-release or thru-axle is secured and not obstructed.',
    ],
  ),
  'suspension_fork': RepairSubtopic(
    id: 101,
    title: 'Suspension Fork (MTB)',
    avatarPath: 'assets/repairIcon/fork.png',
    description:
        'Front suspension air pressure and seal check for mountain biking.',
    tools: [
      'High-Pressure Shock Pump',
      'Isopropyl Alcohol',
      'Lint-free Cloth',
      'Suspension Lube',
    ],
    steps: [
      'Wipe down the stanchions (upper tubes) after every ride to remove grit that can damage seals.',
      'Check Sag: Sit on the bike in riding gear; the O-ring should move 15-25% of the total travel.',
      'Use the shock pump to add air if the fork bottom-outs too easily on small bumps.',
      'Adjust Rebound: Turn the red knob so the fork returns quickly but doesn\'t "jump" off the ground.',
    ],
  ),
  'derailleur': RepairSubtopic(
    id: 7,
    title: 'Derailleur',
    avatarPath: 'assets/repairIcon/derailleur.png',
    description:
        'Adjusting gear indexing and limit screws for smooth shifting.',
    tools: ['Phillips Screwdriver', '5mm Hex key', 'Pliers', 'Chain Lubricant'],
    steps: [
      'High/Low Limits: Adjust the H and L screws so the chain cannot jump off into the spokes or frame.',
      'Index Gears: Turn the barrel adjuster while pedaling to align the pulley wheel with the cassette cog.',
      'Cable Tension: If downshifting is slow, turn the adjuster counter-clockwise to increase tension.',
      'Clean and lube the pivot points of the derailleur arm to ensure snappy movement.',
    ],
  ),
  'sti_shifter': RepairSubtopic(
    id: 80,
    title: 'STI Shifters (Road Dropbar)',
    avatarPath: 'assets/repairIcon/handlebar.png',
    description: 'Road-style integrated brake/shift levers maintenance.',
    tools: [
      '5mm Allen key',
      'Cable cutters',
      'Electrical tape',
      'Light spray oil',
    ],
    steps: [
      'Peel back the rubber hood to inspect the shift cable head for fraying or rust.',
      'Check Cable Tension: Ensure the lever doesn\'t feel "mushy" when initiating a shift.',
      'Lubricate the internal ratchet mechanism with a light spray oil if clicking feels sticky.',
      'Ensure the shifter body is clamped firmly to the dropbar and doesn\'t rotate under hand pressure.',
    ],
  ),
  'rear_suspension': RepairSubtopic(
    id: 90,
    title: 'Rear Shock (X-Cross)',
    avatarPath: 'assets/repairIcon/frame.png',
    description:
        'Rear linkage and air shock maintenance for full-suspension bikes.',
    tools: ['Shock pump', 'Torque wrench', 'Bearing grease', 'Allen key set'],
    steps: [
      'Check Pivot Bolts: Use a torque wrench to ensure frame linkage bolts haven\'t vibrated loose.',
      'Inspect pivot bearings: Lift the bike and move the rear triangle sideways to check for "play".',
      'Set Air Pressure: Match the shock PSI to your body weight according to the frame manufacturer chart.',
      'Clean the shock shaft with alcohol and apply a drop of suspension oil to keep it moving smoothly.',
    ],
  ),
};

final Map<String, List<RepairSubtopic>> repairContent = {
  'Frameset': [
    allSubtopics['rigid_fork']!,
    RepairSubtopic(
      id: 2,
      title: 'Frame Care',
      avatarPath: 'assets/repairIcon/frame.png',
      description:
          'The frame supports all components and must be inspected for safety.',
      tools: ['Torque wrench', 'Hex keys', 'Soft sponge', 'Bike wash soap'],
      steps: [
        'Wash the frame to reveal hidden damage; pay close attention to welds and the bottom bracket area.',
        'Alignment Check: Ensure the rear wheel sits centered between the seat stays.',
        'Bottle Cage Bolts: Tighten loose bolts to prevent annoying rattling during travel.',
        'Apply frame protector stickers in areas where cables rub against the paint.',
      ],
    ),
    RepairSubtopic(
      id: 3,
      title: 'Seatpost & Saddle',
      avatarPath: 'assets/repairIcon/seatpost.png',
      description:
          'Maintain and adjust the seatpost to prevent seizing and ensure comfort.',
      tools: [
        'Anti-seize Grease (or Carbon Paste)',
        '4mm/5mm Allen key',
        'Rag',
      ],
      steps: [
        'Mark your height, remove seatpost, and wipe clean of old grit and moisture.',
        'Apply fresh grease (for metal) or carbon paste (for carbon) to prevent the post from "freezing" in the frame.',
        'Level the saddle: Use a level app on your phone to ensure the seat is horizontal.',
        'Tighten the seat clamp to the manufacturer\'s torque spec (usually 5-6Nm).',
      ],
    ),
  ],
  'Wheelset': [
    RepairSubtopic(
      id: 4,
      title: 'Front Wheel & Hub',
      avatarPath: 'assets/repairIcon/wheel.png',
      description: 'Front wheel assembly and bearing service.',
      tools: ['Spoke wrench', 'Cone wrenches (13/15mm)', 'Bearing grease'],
      steps: [
        'Spin the wheel and look for wobbles; use a spoke wrench to tighten loose spokes (1/4 turn at a time).',
        'Check Hub Play: Wiggle the wheel sideways; if it feels loose, adjust the hub cones.',
        'Inspect the tire casing for glass, thorns, or "sidewall threads" that indicate a pending blowout.',
        'Ensure the valve stem is straight and the lockring is hand-tight.',
      ],
    ),
    RepairSubtopic(
      id: 5,
      title: 'Rear Wheel & Cassette',
      avatarPath: 'assets/repairIcon/wheel.png',
      description: 'Rear wheel, cassette and hub maintenance.',
      tools: [
        'Chain whip',
        'Cassette Lockring tool',
        'Large adjustable wrench',
      ],
      steps: [
        'Remove the rear wheel and use the chain whip/lockring tool to ensure the cassette is tight.',
        'Clean the "Gunk" out from between the cogs using a rag or a thin brush.',
        'Check the Freehub: Spin the cassette backwards; it should click cleanly without dragging.',
        'Ensure the derailleur hanger is straight and not bent inward toward the spokes.',
      ],
    ),
  ],
  'Brakeset': [
    RepairSubtopic(
      id: 6,
      title: 'Brake Pads (Not for Fixie)',
      avatarPath: 'assets/repairIcon/brake.png',
      description:
          'Pads provide braking friction; must be checked for wear and alignment.',
      tools: ['Allen key', 'Medium-grit Sandpaper', 'Isopropyl Alcohol'],
      steps: [
        'Check Wear Line: If the grooves on the pad are gone, replace them immediately.',
        'Sand the Surface: Lightly sand the pads to remove the "glaze" and improve stopping power.',
        'Centering: Adjust the caliper so the pads hit the rim/rotor at exactly the same time.',
        'Rim/Rotor Cleaning: Wipe the braking surface with alcohol to remove oil and road grime.',
      ],
    ),
  ],
  'Groupset': [
    allSubtopics['derailleur']!,
    allSubtopics['sti_shifter']!,

    RepairSubtopic(
      id: 20,
      title: 'Fixed Gear Drivetrain',
      avatarPath: 'assets/repairIcon/chain.png',
      description: 'Essential maintenance for brakeless Fixie setups.',
      tools: ['15mm Wrench', 'Chain Tensioner', 'Heavy-duty Lube'],
      steps: [
        'Tension: Ensure the chain has about 1/2 inch of vertical movement.',
        'Lockring Check: Use a lockring tool to ensure the cog cannot spin off during skidding.',
        'Alignment: Ensure the rear wheel is straight so the chain runs in a perfect line.',
      ],
    ),
  ],
  'Cockpit': [
    RepairSubtopic(
      id: 8,
      title: 'Handlebar (Cockpit)',
      avatarPath: 'assets/repairIcon/handlebar.png',
      description: 'Control maintenance and bar tape service for better grip.',
      tools: ['Torque wrench', 'Scissors', 'New Bar Tape', 'Degreaser'],
      steps: [
        'Inspect the bars for "notches" or deep scratches that could lead to sudden snapping.',
        'Re-wrap Tape: Wrap from the ends to the center, keeping constant tension for a smooth finish.',
        'Check Bolt Torque: Ensure the 4 stem faceplate bolts are tightened to the same tension.',
        'Verify that all control cables (brake/shift) have enough slack to turn the bars fully.',
      ],
    ),
  ],
};
