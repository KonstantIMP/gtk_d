module gtk.SingleSelection;

private import gio.ListModelIF;
private import gio.ListModelT;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.SelectionModelIF;
private import gtk.SelectionModelT;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkSingleSelection` is a `GtkSelectionModel` that allows selecting a single
 * item.
 * 
 * Note that the selection is *persistent* -- if the selected item is removed
 * and re-added in the same ::items-changed emission, it stays selected.
 * In particular, this means that changing the sort order of an underlying sort
 * model will preserve the selection.
 */
public class SingleSelection : ObjectG, ListModelIF, SelectionModelIF
{
	/** the main Gtk struct */
	protected GtkSingleSelection* gtkSingleSelection;

	/** Get the main Gtk struct */
	public GtkSingleSelection* getSingleSelectionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSingleSelection;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSingleSelection;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSingleSelection* gtkSingleSelection, bool ownedRef = false)
	{
		this.gtkSingleSelection = gtkSingleSelection;
		super(cast(GObject*)gtkSingleSelection, ownedRef);
	}

	// add the ListModel capabilities
	mixin ListModelT!(GtkSingleSelection);

	// add the SelectionModel capabilities
	mixin SelectionModelT!(GtkSingleSelection);


	/** */
	public static GType getType()
	{
		return gtk_single_selection_get_type();
	}

	/**
	 * Creates a new selection to handle @model.
	 *
	 * Params:
	 *     model = the `GListModel` to manage
	 *
	 * Returns: a new `GtkSingleSelection`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ListModelIF model)
	{
		auto __p = gtk_single_selection_new((model is null) ? null : model.getListModelStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSingleSelection*) __p, true);
	}

	/**
	 * Checks if autoselect has been enabled or disabled via
	 * gtk_single_selection_set_autoselect().
	 *
	 * Returns: %TRUE if autoselect is enabled
	 */
	public bool getAutoselect()
	{
		return gtk_single_selection_get_autoselect(gtkSingleSelection) != 0;
	}

	/**
	 * If %TRUE, gtk_selection_model_unselect_item() is supported and allows
	 * unselecting the selected item.
	 *
	 * Returns: %TRUE to support unselecting
	 */
	public bool getCanUnselect()
	{
		return gtk_single_selection_get_can_unselect(gtkSingleSelection) != 0;
	}

	/**
	 * Gets the model that @self is wrapping.
	 *
	 * Returns: The model being wrapped
	 */
	public ListModelIF getModel()
	{
		auto __p = gtk_single_selection_get_model(gtkSingleSelection);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ListModelIF)(cast(GListModel*) __p);
	}

	/**
	 * Gets the position of the selected item.
	 *
	 * If no item is selected, %GTK_INVALID_LIST_POSITION is returned.
	 *
	 * Returns: The position of the selected item
	 */
	public uint getSelected()
	{
		return gtk_single_selection_get_selected(gtkSingleSelection);
	}

	/**
	 * Gets the selected item.
	 *
	 * If no item is selected, %NULL is returned.
	 *
	 * Returns: The selected item
	 */
	public ObjectG getSelectedItem()
	{
		auto __p = gtk_single_selection_get_selected_item(gtkSingleSelection);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ObjectG)(cast(GObject*) __p);
	}

	/**
	 * Enables or disables autoselect.
	 *
	 * If @autoselect is %TRUE, @self will enforce that an item is always
	 * selected. It will select a new item when the currently selected
	 * item is deleted and it will disallow unselecting the current item.
	 *
	 * Params:
	 *     autoselect = %TRUE to always select an item
	 */
	public void setAutoselect(bool autoselect)
	{
		gtk_single_selection_set_autoselect(gtkSingleSelection, autoselect);
	}

	/**
	 * If %TRUE, unselecting the current item via
	 * gtk_selection_model_unselect_item() is supported.
	 *
	 * Note that setting [property@Gtk.SingleSelection:autoselect] will
	 * cause unselecting to not work, so it practically makes no sense
	 * to set both at the same time the same time.
	 *
	 * Params:
	 *     canUnselect = %TRUE to allow unselecting
	 */
	public void setCanUnselect(bool canUnselect)
	{
		gtk_single_selection_set_can_unselect(gtkSingleSelection, canUnselect);
	}

	/**
	 * Sets the model that @self should wrap.
	 *
	 * If @model is %NULL, @self will be empty.
	 *
	 * Params:
	 *     model = A `GListModel` to wrap
	 */
	public void setModel(ListModelIF model)
	{
		gtk_single_selection_set_model(gtkSingleSelection, (model is null) ? null : model.getListModelStruct());
	}

	/**
	 * Selects the item at the given position.
	 *
	 * If the list does not have an item at @position or
	 * %GTK_INVALID_LIST_POSITION is given, the behavior depends on the
	 * value of the [property@Gtk.SingleSelection:autoselect] property:
	 * If it is set, no change will occur and the old item will stay
	 * selected. If it is unset, the selection will be unset and no item
	 * will be selected.
	 *
	 * Params:
	 *     position = the item to select or %GTK_INVALID_LIST_POSITION
	 */
	public void setSelected(uint position)
	{
		gtk_single_selection_set_selected(gtkSingleSelection, position);
	}
}
