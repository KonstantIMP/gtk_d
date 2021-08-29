module gtk.NoSelection;

private import gio.ListModelIF;
private import gio.ListModelT;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.SelectionModelIF;
private import gtk.SelectionModelT;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkNoSelection` is a `GtkSelectionModel` that does not allow selecting
 * anything.
 * 
 * This model is meant to be used as a simple wrapper around a `GListModel`
 * when a `GtkSelectionModel` is required.
 */
public class NoSelection : ObjectG, ListModelIF, SelectionModelIF
{
	/** the main Gtk struct */
	protected GtkNoSelection* gtkNoSelection;

	/** Get the main Gtk struct */
	public GtkNoSelection* getNoSelectionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkNoSelection;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkNoSelection;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkNoSelection* gtkNoSelection, bool ownedRef = false)
	{
		this.gtkNoSelection = gtkNoSelection;
		super(cast(GObject*)gtkNoSelection, ownedRef);
	}

	// add the ListModel capabilities
	mixin ListModelT!(GtkNoSelection);

	// add the SelectionModel capabilities
	mixin SelectionModelT!(GtkNoSelection);


	/** */
	public static GType getType()
	{
		return gtk_no_selection_get_type();
	}

	/**
	 * Creates a new selection to handle @model.
	 *
	 * Params:
	 *     model = the `GListModel` to manage
	 *
	 * Returns: a new `GtkNoSelection`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ListModelIF model)
	{
		auto __p = gtk_no_selection_new((model is null) ? null : model.getListModelStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkNoSelection*) __p, true);
	}

	/**
	 * Gets the model that @self is wrapping.
	 *
	 * Returns: The model being wrapped
	 */
	public ListModelIF getModel()
	{
		auto __p = gtk_no_selection_get_model(gtkNoSelection);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ListModelIF)(cast(GListModel*) __p);
	}

	/**
	 * Sets the model that @self should wrap.
	 *
	 * If @model is %NULL, this model will be empty.
	 *
	 * Params:
	 *     model = A `GListModel` to wrap
	 */
	public void setModel(ListModelIF model)
	{
		gtk_no_selection_set_model(gtkNoSelection, (model is null) ? null : model.getListModelStruct());
	}
}
