enum PerformerEnum {
  blackpink(
    name: 'BLACKPINK',
  ),
  jennie(
    name: 'JENNIE',
  ),
  lisa(
    name: 'LISA',
  ),
  rose(
    name: 'ROSÉ',
  ),
  selenaGomez(
    name: 'Selena Gomez',
  ),
  cardiB(
    name: 'Cardi B',
  ),
  ;

  const PerformerEnum({
    required this.name,
  });

  final String name;
}
