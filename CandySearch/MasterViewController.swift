

import UIKit

class MasterViewController: UITableViewController {
  
  // MARK: - Properties
  var detailViewController: DetailViewController? = nil
  var cityes = [City]()
  var filteredCityes = [City]()
  let searchController = UISearchController(searchResultsController: nil)
  
  // MARK: - View Setup
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Setup the Search Controller
    searchController.searchResultsUpdater = self
    searchController.searchBar.delegate = self
    definesPresentationContext = true
    searchController.dimsBackgroundDuringPresentation = false
    
    // Setup the Scope Bar
  //  searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
    tableView.tableHeaderView = searchController.searchBar
    //массив строк в таблице городов
    cityes = [
        City(category:"Other", name:"Абзаково",text:"Оздоровительно-спортивный центр Абзаково расположен в Башкортостане, на восточных склонах одного из южно-урвльских хребтов Кырыкты-Тау, на склонах горы Шайтан, на высоте 820 метров над уровнем моря.Здесь любят отдыхать не только жители блиайшего города - Магнитогорска, но и жители Урала, Сибири, а так же любител  зимних видов спорта из тенральных районов Росии. Абзаково располагает горнолыжными трассами всех категорий , включая трассы для слалома и слалома-гиганта , имеющие FIS сертификаты.Современные подъемники обеспечивают катание без очередей. Снегоуплотнительные машины осуществляют подготовку трасс."),
        City( category:"Other",name:"Адлер",text:"Адлер-курорт на Ч]рном море, отдаленный микрорайон города Сочи. Этот район расположен на равнине, при впадении в Чёрное море реки Мзымты, с севера защищен Главным Кавказским хребтом с его вечными льдами и не тающими даже летом, вершинами, что тем самым обуславливает здесь относительно высокие среднегодовые температуры воздуха.Купальный сезон здесь продолжается 5 месяцев с июня по октябрь, летом средняя температура воздуха +26,5С, воды +24,5С. Благоприятные сезоны для санаторно-курортного лечения: осень, зима, весна. В период «зимы», средняя температура воздуха составляет +9, +10С."),
        City(category:"Other",name:"Адыгея",text:""),
      City(category:"Other",name:"Анапа",text:""),
     
        
      
    ]
    
    if let splitViewController = splitViewController {
      let controllers = splitViewController.viewControllers
      detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
    super.viewWillAppear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table View
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  //подсчет количества строк в таблице
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if searchController.isActive && searchController.searchBar.text != "" {
      return filteredCityes.count
    }
    return cityes.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let city: City
    if searchController.isActive && searchController.searchBar.text != "" {
      city = filteredCityes[(indexPath as NSIndexPath).row]
    } else {
      city = cityes[(indexPath as NSIndexPath).row]
    }
    cell.textLabel!.text = city.name
 //   cell.detailTextLabel!.text = candy.category
    return cell
  }
  //фильтр строк в таблице
  func filterContentForSearchText(_ searchText: String, scope: String = "All") {
    filteredCityes = cityes.filter({( city : City) -> Bool in
     let categoryMatch = (scope == "All") || (city.category == scope)
      return categoryMatch && city.name.lowercased().contains(searchText.lowercased())
    })
    tableView.reloadData()
  }
  
  // MARK: - Segues
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
      if let indexPath = tableView.indexPathForSelectedRow {
        let city: City
        if searchController.isActive && searchController.searchBar.text != "" {
          city = filteredCityes[(indexPath as NSIndexPath).row]
        } else {
          city = cityes[(indexPath as NSIndexPath).row]
        }
        let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
        controller.detailCity = city
        controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        controller.navigationItem.leftItemsSupplementBackButton = true
      }
    }
  }
  
}

extension MasterViewController: UISearchBarDelegate {
  // MARK: - UISearchBar Delegate
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
  }
}

extension MasterViewController: UISearchResultsUpdating {
  // MARK: - UISearchResultsUpdating Delegate
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
    filterContentForSearchText(searchController.searchBar.text!, scope: scope)
  }
}
