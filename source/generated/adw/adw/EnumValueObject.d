module adw.EnumValueObject;

private import adw.c.functions;
public  import adw.c.types;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;


/**
 * `AdwEnumValueObject` is the type of items in a [class@Adw.EnumListModel].
 *
 * Since: 1.0
 */
public class EnumValueObject : ObjectG
{
	/** the main Gtk struct */
	protected AdwEnumValueObject* adwEnumValueObject;

	/** Get the main Gtk struct */
	public AdwEnumValueObject* getEnumValueObjectStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return adwEnumValueObject;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)adwEnumValueObject;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AdwEnumValueObject* adwEnumValueObject, bool ownedRef = false)
	{
		this.adwEnumValueObject = adwEnumValueObject;
		super(cast(GObject*)adwEnumValueObject, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return adw_enum_value_object_get_type();
	}

	/**
	 * Gets the enum value name.
	 *
	 * Returns: the enum value name
	 *
	 * Since: 1.0
	 */
	public string getName()
	{
		return Str.toString(adw_enum_value_object_get_name(adwEnumValueObject));
	}

	/**
	 * Gets the enum value nick.
	 *
	 * Returns: the enum value nick
	 *
	 * Since: 1.0
	 */
	public string getNick()
	{
		return Str.toString(adw_enum_value_object_get_nick(adwEnumValueObject));
	}

	/**
	 * Gets the enum value.
	 *
	 * Returns: the enum value
	 *
	 * Since: 1.0
	 */
	public int getValue()
	{
		return adw_enum_value_object_get_value(adwEnumValueObject);
	}
}
