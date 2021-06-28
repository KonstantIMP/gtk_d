module gtk.AlternativeTrigger;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.ShortcutTrigger;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GtkShortcutTrigger` that combines two triggers.
 * 
 * The `GtkAlternativeTrigger` triggers when either of two trigger.
 * 
 * This can be cascaded to combine more than two triggers.
 */
public class AlternativeTrigger : ShortcutTrigger
{
	/** the main Gtk struct */
	protected GtkAlternativeTrigger* gtkAlternativeTrigger;

	/** Get the main Gtk struct */
	public GtkAlternativeTrigger* getAlternativeTriggerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkAlternativeTrigger;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkAlternativeTrigger;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkAlternativeTrigger* gtkAlternativeTrigger, bool ownedRef = false)
	{
		this.gtkAlternativeTrigger = gtkAlternativeTrigger;
		super(cast(GtkShortcutTrigger*)gtkAlternativeTrigger, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_alternative_trigger_get_type();
	}

	/**
	 * Creates a `GtkShortcutTrigger` that will trigger whenever
	 * either of the two given triggers gets triggered.
	 *
	 * Note that nesting is allowed, so if you want more than two
	 * alternative, create a new alternative trigger for each option.
	 *
	 * Params:
	 *     first = The first trigger that may trigger
	 *     second = The second trigger that may trigger
	 *
	 * Returns: a new `GtkShortcutTrigger`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ShortcutTrigger first, ShortcutTrigger second)
	{
		auto __p = gtk_alternative_trigger_new((first is null) ? null : first.getShortcutTriggerStruct(), (second is null) ? null : second.getShortcutTriggerStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkAlternativeTrigger*) __p, true);
	}

	/**
	 * Gets the first of the two alternative triggers that may
	 * trigger @self.
	 *
	 * [method@Gtk.AlternativeTrigger.get_second] will return
	 * the other one.
	 *
	 * Returns: the first alternative trigger
	 */
	public ShortcutTrigger getFirst()
	{
		auto __p = gtk_alternative_trigger_get_first(gtkAlternativeTrigger);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutTrigger)(cast(GtkShortcutTrigger*) __p);
	}

	/**
	 * Gets the second of the two alternative triggers that may
	 * trigger @self.
	 *
	 * [method@Gtk.AlternativeTrigger.get_first] will return
	 * the other one.
	 *
	 * Returns: the second alternative trigger
	 */
	public ShortcutTrigger getSecond()
	{
		auto __p = gtk_alternative_trigger_get_second(gtkAlternativeTrigger);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutTrigger)(cast(GtkShortcutTrigger*) __p);
	}
}
