module adw.EnumListModel;

private import adw.c.functions;
public  import adw.c.types;
private import gio.ListModelIF;
private import gio.ListModelT;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * A [iface@Gio.ListModel] representing values of a given enum.
 * 
 * `AdwEnumListModel` contains objects of type [class@AdwEnumListItem].
 *
 * Since: 1.0
 */
public class EnumListModel : ObjectG, ListModelIF
{
	/** the main Gtk struct */
	protected AdwEnumListModel* adwEnumListModel;

	/** Get the main Gtk struct */
	public AdwEnumListModel* getEnumListModelStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return adwEnumListModel;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)adwEnumListModel;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AdwEnumListModel* adwEnumListModel, bool ownedRef = false)
	{
		this.adwEnumListModel = adwEnumListModel;
		super(cast(GObject*)adwEnumListModel, ownedRef);
	}

	// add the ListModel capabilities
	mixin ListModelT!(AdwEnumListModel);


	/** */
	public static GType getType()
	{
		return adw_enum_list_model_get_type();
	}

	/**
	 * Creates a new `AdwEnumListModel` for @enum_type.
	 *
	 * Params:
	 *     enumType = the type of the enum to construct the model from
	 *
	 * Returns: the newly created `AdwEnumListModel`
	 *
	 * Since: 1.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GType enumType)
	{
		auto __p = adw_enum_list_model_new(enumType);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(AdwEnumListModel*) __p, true);
	}

	/**
	 * Finds the position of a given enum value in @self.
	 *
	 * Params:
	 *     value = an enum value
	 *
	 * Since: 1.0
	 */
	public uint findPosition(int value)
	{
		return adw_enum_list_model_find_position(adwEnumListModel, value);
	}

	/**
	 * Gets the type of the enum represented by @self.
	 *
	 * Returns: the enum type
	 *
	 * Since: 1.0
	 */
	public GType getEnumType()
	{
		return adw_enum_list_model_get_enum_type(adwEnumListModel);
	}
}
